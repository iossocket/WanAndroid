//
//  BannerItemView.swift
//  WanAndroid
//
//  Created by ZhuXueliang on 2019/5/11.
//  Copyright © 2019 iossocket. All rights reserved.
//

import UIKit
import Kingfisher

class BannerItemView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    class func loadNib(banner: Banner) -> UIView {
        guard let view = Bundle.main.loadNibNamed("BannerItemView", owner: nil, options: nil)?.first as? BannerItemView else {
            return UIView()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        let url = URL(string: banner.imagePath)
        view.imageView.kf.setImage(with: url)
        
        return view
    }
}
