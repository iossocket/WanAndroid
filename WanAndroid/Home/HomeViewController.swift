//
//  HomeViewController.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 17/4/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import UIKit

protocol HomeView: class {
    func displayBanners(banners: [Banner])
    func displayArticlesByDataSource(_ dataSource: HomeDataSource)
    func displayError()
}

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var headerView: HomeBanner?
    private var dataSource: HomeDataSource? {
        didSet {
            tableView.dataSource = dataSource
            tableView.delegate = dataSource
            tableView.reloadData()
            tableView.mj_header.endRefreshing()
            dataSource!.hasMorePage ? tableView.mj_footer.endRefreshing() : tableView.mj_footer.endRefreshingWithNoMoreData()
        }
    }
    
    var interactor: HomeInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tableView.accessibilityIdentifier = "home_page_tableview"
        setup()
        setupHeaderView()
        setupFetch()
        interactor?.loadInitialData()
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
    
    private func setupFetch() {
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            self?.interactor?.loadInitialData()
        })
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: { [weak self] in
            self?.interactor?.loadMoreData(dataSource: self?.dataSource)
        })
    }
}

extension HomeViewController: HomeView {
    func displayBanners(banners: [Banner]) {
        headerView?.reload(banners: banners)
    }
    
    func displayArticlesByDataSource(_ dataSource: HomeDataSource) {
        self.dataSource = dataSource
    }
    
    func displayError() {
        if let header = tableView.mj_header, header.state != .idle {
            header.endRefreshing()
        }
        if let footer = tableView.mj_footer, footer.state != .idle {
            footer.endRefreshing()
        }
    }
}
