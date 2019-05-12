//
//  Skeleton.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 17/4/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import UIKit

typealias ViewControllerCreator = () -> UIViewController

class Skeleton {
    
    struct TabBarViewControllerInfo {
        let creator: ViewControllerCreator
        let title: String
        let icon: Iconfont
        let tag: Int
    }
    
    let homeCreator: ViewControllerCreator = {
        let root = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
        root.title = "WanAndroid"
        let nav = UINavigationController(rootViewController: root)
        return nav
    }
    
    func rootViewController() -> UIViewController {
        let tabBarViewController = UITabBarController()
        tabBarViewController.selectedIndex = 0
        tabBarViewController.viewControllers = tabBarViewControllerInfos().map { generateVC(info: $0) }
        return tabBarViewController
    }
    
    private func tabBarViewControllerInfos() -> [TabBarViewControllerInfo] {
        return [
            TabBarViewControllerInfo(creator: homeCreator, title: "Home", icon: Iconfont.home, tag: 0),
            TabBarViewControllerInfo(creator: { KnowledgeViewController() }, title: "Knowledge", icon: Iconfont.knowledge, tag: 1),
            TabBarViewControllerInfo(creator: { WeChatViewController() }, title: "WeChat", icon: Iconfont.wechat, tag: 2),
            TabBarViewControllerInfo(creator: { NavigationViewController() }, title: "Navigation", icon: Iconfont.navigation, tag: 3),
            TabBarViewControllerInfo(creator: { ProjectViewController() }, title: "Project", icon: Iconfont.project, tag: 4)
        ]
    }
    
    private func generateVC(info: TabBarViewControllerInfo) -> UIViewController {
        let vc = info.creator()
        vc.tabBarItem = UITabBarItem(title: info.title, image: tabBarImage(icon: info.icon), tag: info.tag)
        return vc
    }
    
    private func tabBarImage(icon: Iconfont) -> UIImage? {
        return UIImage(text: icon, size: 24)
    }
}
