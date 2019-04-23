//
//  HomeViewController.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 17/4/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import UIKit
import Moya

protocol HomeView: class {
    func displayBanners()
    func displayError()
}

class HomeViewController: UIViewController {
    
    var interactor: HomeInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setup()
        interactor?.loadData()
    }
    
    private func setup() {
        interactor = HomeInteractor()
        interactor?.presenter = HomePresenter(view: self)
    }
}

extension HomeViewController: HomeView {
    func displayBanners() {
        
    }
    
    func displayError() {
        
    }
}
