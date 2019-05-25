//
//  HomeInteractor.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 23/4/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import Moya

protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? { get set }
    func loadInitialData()
    func loadMoreData(dataSource: HomeDataSource?)
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    private var provider: MoyaProvider<WanAndroidService>
    
    init(provider: MoyaProvider<WanAndroidService> = MoyaProvider()) {
        self.provider = provider
    }
    
    func loadInitialData() {
        fetchBanners()
        fetchAtriclesByIndex(0)
    }
    
    func loadMoreData(dataSource: HomeDataSource?) {
        guard let dataSource = dataSource else { return }
        if !dataSource.hasMorePage {
            return
        }
        
        fetchAtriclesByIndex(dataSource.currentPage, previousList: dataSource.currentArticleViewModels())
    }
    
    private func fetchAtriclesByIndex(_ index: Int, previousList: [ArticleViewModel] = []) {
        provider.request(.articleList(index: index)) { [weak self] result in
            switch result {
            case .success(let value):
                guard let articleList = try? JSONDecoder().decode(ResponseWrapper<ArticleList>.self, from: value.data) else {
                    self?.presenter?.displayError(.parseError)
                    return
                }
                self?.presenter?.displayArticleList(articleList.data, previousList: previousList)
            case .failure( _):
                self?.presenter?.displayError(.requestFailed)
            }
        }
    }
    
    private func fetchBanners() {
        provider.request(.banner) { [weak self] result in
            switch result {
            case .success(let value):
                guard let banners = try? JSONDecoder().decode(ResponseWrapper<[Banner]>.self, from: value.data) else {
                    self?.presenter?.displayError(.parseError)
                    return
                }
                self?.presenter?.displayBanners(banners.data)
            case .failure( _):
                self?.presenter?.displayError(.requestFailed)
            }
        }
    }
}
