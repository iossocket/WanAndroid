//
//  HomeBanner.swift
//  WanAndroid
//
//  Created by ZhuXueliang on 2019/5/11.
//  Copyright © 2019 iossocket. All rights reserved.
//

import UIKit

protocol HomeBannerDelegate: class {
    func didSelectBanner(_ banner: Banner)
}

class HomeBanner: UIView {
    
    static let HEIGHT: CGFloat = 200
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageHolderView: UIView!
    
    weak var delegate: HomeBannerDelegate?
    
    private var banners: [Banner] = []
    
    class func loadNib() -> HomeBanner {
        guard let view = Bundle.main.loadNibNamed("HomeBanner", owner: nil, options: nil)?.first as? HomeBanner else {
            return HomeBanner()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        view.scrollView.isPagingEnabled = true
        view.pageHolderView.isHidden = true
        return view
    }
    
    func reload(banners: [Banner]) {
        if (banners.count == 0) {
            return
        }
        scrollView.delegate = self
        self.banners = banners
        pageHolderView.isHidden = false
        pageControl.numberOfPages = banners.count
        
        setPageContent(index: 0)
        
        var itemViews = banners.map { banner -> UIView in
            return BannerItemView.loadNib(banner: banner)
        }
        
        
        for (index, itemView) in itemViews.enumerated() {
            scrollView.addSubview(itemView)
            
            itemView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            itemView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            itemView.heightAnchor.constraint(equalToConstant: HomeBanner.HEIGHT).isActive = true
            itemView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            
            
            if index == 0 {
                itemView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
            } else {
                itemView.leadingAnchor.constraint(equalTo: itemViews[index - 1].trailingAnchor).isActive = true
            }
            
            if index == itemViews.count - 1 {
                itemView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
            }
        }
    }
}

extension HomeBanner: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let indexOfPage: Int = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        setPageContent(index: indexOfPage)
    }
    
    private func setPageContent(index: Int) {
        titleLabel.text = banners[index].title
        pageControl.currentPage = index
    }
}
