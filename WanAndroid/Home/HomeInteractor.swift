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
    func loadData()
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    private var provider: MoyaProvider<WanAndroidService>
    
    init(provider: MoyaProvider<WanAndroidService> = MoyaProvider()) {
        self.provider = provider
    }
    
    func loadData() {
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
