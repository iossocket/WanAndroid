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
    convenience init?(text: Iconfont, fontSize: CGFloat, imageSize: CGSize = CGSize.zero, imageColor: UIColor = UIColor.black) {
        guard let iconfont = UIFont.iconFontOf(fontSize) else {
            self.init()
            return nil
        }
        var imageRect = CGRect(origin: CGPoint.zero, size: imageSize)
        if __CGSizeEqualToSize(imageSize, CGSize.zero) {
            imageRect = CGRect(origin: CGPoint.zero, size: text.rawValue.size(withAttributes: [NSAttributedString.Key.font: iconfont]))
        }
        UIGraphicsBeginImageContextWithOptions(imageRect.size, false, UIScreen.main.scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center
        text.rawValue.draw(in: imageRect, withAttributes: [NSAttributedString.Key.font : iconfont, NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.foregroundColor: imageColor])
        guard let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return nil
        }
        self.init(cgImage: cgImage)
    }
}
