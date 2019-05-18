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
    func displayArticles(_ articles: [ArticleViewModel])
    func displayError()
}

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var headerView: HomeBanner?
    private let refreshControl: UIRefreshControl = UIRefreshControl()
    
    var interactor: HomeInteractorProtocol?
    var articles: [ArticleViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tableView.accessibilityIdentifier = "home_page_tableview"
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        setup()
        setupHeaderView()
        interactor?.loadInitialData()
    }
    
    @objc func refreshWeatherData(_ sender: Any) {
        print("begin refresh")
        self.refreshControl.beginRefreshing()
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
}

extension HomeViewController: HomeView {
    func displayBanners(banners: [Banner]) {
        headerView?.reload(banners: banners)
    }
    
    func displayArticles(_ articles: [ArticleViewModel]) {
        print("end refresh")
        self.articles = articles
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func displayError() {
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = articles[index].title
        cell.detailTextLabel?.text = articles[index].author
        return cell
    }
}
