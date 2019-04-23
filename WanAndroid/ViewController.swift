//
//  ViewController.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 14/4/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        let image = UIImage(text: .home, size: 90)!
        
        let imageView = UIImageView(image: image)
        
        imageView.frame = CGRect(origin: CGPoint(x: 20, y: 100), size: image.size)
        
        view.addSubview(imageView)
    }


}

