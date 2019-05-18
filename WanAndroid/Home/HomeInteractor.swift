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
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    private var provider: MoyaProvider<WanAndroidService>
    
    init(provider: MoyaProvider<WanAndroidService> = MoyaProvider()) {
        self.provider = provider
    }
    
    func loadInitialData() {
        fetchBanners()
        fetchInitialArticles()
    }
    
    private func fetchInitialArticles() {
        provider.request(.articleList(index: 0)) { [weak self] result in
            switch result {
            case .success(let value):
                guard let articleList = try? JSONDecoder().decode(ResponseWrapper<ArticleList>.self, from: value.data) else {
                    self?.presenter?.displayError(.parseError)
                    return
                }
                self?.presenter?.displayArticleList(articleList.data.datas)
            case .failure( _):
                print("failed")
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
