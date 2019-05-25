//
//  Banner.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 23/4/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import Foundation

struct Banner: Decodable {
    let id: Int
    let title: String
    let desc: String
    let imagePath: String
    let isVisible: Int
    let order: Int
    let type: Int
    let url: String
}
