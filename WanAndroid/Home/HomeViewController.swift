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
    func displayBanners(banners: [Banner])
    func displayError()
}

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var headerView: HomeBanner?
    
    var interactor: HomeInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setup()
        setupHeaderView()
        interactor?.loadData()
    }
    
    private func setup() {
        interactor = HomeInteractor()
        interactor?.presenter = HomePresenter(view: self)
    }
    
    private func setupHeaderView() {
        headerView = HomeBanner.loadNib()
        guard let header = headerView else { return }
        tableView.setTableHeaderView(header, height: HomeBanner.HEIGHT)
        tableView.tableFooterView = UIView()
    }
}

extension HomeViewController: HomeView {
    func displayBanners(banners: [Banner]) {
        headerView?.reload(banners: banners)
    }
    
    func displayError() {
        
    }
}
