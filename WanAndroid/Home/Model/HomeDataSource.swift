//
//  HomeDataSource.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 18/5/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import UIKit

class HomeDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let currentPage: Int
    private let articles: [ArticleViewModel]
    private let totalPage: Int

    var hasMorePage: Bool {
        return totalPage > currentPage
    }
    
    init(articleList: ArticleList, previousList: [ArticleViewModel] = []) {
        self.articles = previousList + articleList.datas.map({ ArticleViewModel(title: $0.title, author: $0.author) })
        
        currentPage = articleList.curPage
        totalPage = articleList.pageCount
        super.init()
    }
    
    func currentArticleViewModels() -> [ArticleViewModel] {
        return articles
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let article = articles[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.author
        
        return cell
    }
}
