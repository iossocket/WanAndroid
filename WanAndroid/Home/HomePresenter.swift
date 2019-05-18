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
    func displayArticleList(_ list: [Article])
}

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeView?
    
    init(view: HomeView) {
        self.view = view
    }
    
    func displayBanners(_ banners: [Banner]) {
        view?.displayBanners(banners: banners)
    }
    
    func displayArticleList(_ list: [Article]) {
        view?.displayArticles(list.map { ArticleViewModel(title: $0.title, author: $0.author) })
    }
    
    func displayError(_ error: WanAndroidService.APIError) {
        view?.displayError()
    }
}
