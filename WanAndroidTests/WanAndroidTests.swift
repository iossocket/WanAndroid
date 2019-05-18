//
//  WanAndroidTests.swift
//  WanAndroidTests
//
//  Created by ZHU XUELIANG on 14/4/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import XCTest
import EarlGrey
@testable import WanAndroid

class WanAndroidTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
//        let success = GREYCondition(name: "Wait for main root view controller") { () -> Bool in
//            let delegate = UIApplication.shared.delegate
//            guard let rootVC = delegate?.window??.rootViewController else {
//                return false
//            }
//            return rootVC.isKind(of: UITabBarController.self)
//        }.wait(withTimeout: 5)
//
//        GREYAssertTrue(success, reason: "Main view controller should appear within 5 seconds.");
    }

    func testExample() {
        EarlGrey.selectElement(with: grey_keyWindow()).assert(grey_sufficientlyVisible())
        EarlGrey.selectElement(with: grey_accessibilityID("home_page_tableview")).assert(grey_sufficientlyVisible())
    }
}
