//
//  HomePresenter.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 23/4/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol {
    func displayError(_ error: WanAndroidService.APIError)
    func displayBanners(_ banners: [Banner])
}

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeView?
    
    init(view: HomeView) {
        self.view = view
    }
    
    func displayBanners(_ banners: [Banner]) {
        view?.displayBanners(banners: banners)
    }
    
    func displayError(_ error: WanAndroidService.APIError) {
        view?.displayError()
    }
}
