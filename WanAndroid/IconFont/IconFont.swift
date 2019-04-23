//
//  IconFont.swift
//  WanAndroid
//
//  Created by ZHU XUELIANG on 14/4/19.
//  Copyright © 2019 iossocket. All rights reserved.
//

import UIKit

public enum Iconfont: String {
    case knowledge = "\u{e701}"
    case wechat = "\u{e64f}"
    case project = "\u{e63d}"
    case navigation = "\u{e7f2}"
    case home = "\u{e759}"
}

extension UIFont {
    class func iconFontOf(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "iconfont", size: size)
    }
}

extension UIImage {
    
    convenience init?(text: Iconfont, size: CGFloat, imageColor: UIColor = UIColor.black) {
        let scale = UIScreen.main.scale
        let realSize = scale * size
        guard let iconfont = UIFont.iconFontOf(realSize) else {
            return nil
        }
        UIGraphicsBeginImageContext(CGSize(width: realSize, height: realSize))
        defer {
            UIGraphicsEndImageContext()
        }
        text.rawValue.draw(at: .zero, withAttributes: [NSAttributedString.Key.font : iconfont, NSAttributedString.Key.foregroundColor: imageColor])
        guard let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return nil
        }
        self.init(cgImage: cgImage, scale: scale, orientation: UIImage.Orientation.up)
    }
}
