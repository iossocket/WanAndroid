//
//  ResponseWrapper.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 23/4/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import Foundation

struct ResponseWrapper<DataType: Decodable>: Decodable {
    let data: DataType
    let errorCode: Int
    let errorMsg: String
}
