//
//  KnowledgeViewController.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 17/4/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import UIKit
import Lottie

class KnowledgeViewController: UIViewController {
    
    var loadingAnimationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        loadingAnimationView = AnimationView(name: "loading")
        view.addSubview(loadingAnimationView)
        loadingAnimationView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadingAnimationView.play()
    }
}
