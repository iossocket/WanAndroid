//
//  Article.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 18/5/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import Foundation

struct ArticleTag: Decodable {
    let name: String
    let url: String
}

struct Article: Decodable {
    let id: Int
    let title: String
    let author: String
    let desc: String
    let envelopePic: String
    let link: String
    let publishTime: Int
    let niceDate: String
    let tags: [ArticleTag]
    let zan: Int
    let type: Int
    let userId: Int
    
    let fresh: Bool
    let chapterId: Int
    let chapterName: String
    let collect: Bool
    let courseId: Int
    let superChapterId: Int
    let superChapterName: String
    
    let origin: String
    let prefix: String
    let visible: Int
    
    let projectLink: String
    let apkLink: String
}

struct ArticleList: Decodable {
    let curPage: Int
    let datas: [Article]
    let offset: Int
    let over: Bool
    let pageCount: Int
    let size: Int
    let total: Int
}
