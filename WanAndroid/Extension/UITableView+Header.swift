//
//  UITableView+Header.swift
//  WanAndroid
//
//  Created by ZhuXueliang on 2019/5/12.
//  Copyright © 2019 iossocket. All rights reserved.
//

import UIKit

extension UITableView {
    
    func setTableHeaderView(_ headerView: UIView, height: CGFloat) {
        
        self.tableHeaderView = headerView
        
        headerView.heightAnchor.constraint(equalToConstant: height).isActive = true
        headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    
    /**
     override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
     
        // 3. Update layout every time device is rotated.
        DispatchQueue.main.async {
            self.tableView.updateHeaderViewFrame()
        }
     }
     */
    func updateHeaderViewFrame() {
        guard let headerView = self.tableHeaderView else { return }
        // Update the size of the header based on its internal content.
        headerView.layoutIfNeeded()
        // ***Trigger table view to know that header should be updated.
        let header = self.tableHeaderView
        self.tableHeaderView = header
    }
}
