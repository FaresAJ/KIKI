//
//  UIScrollViewExtension.swift
//  KIKI
//
//  Created by Fares Ajimi on 25/11/2021.
//

import UIKit

extension UIScrollView {

    func setContentSize() {
        let margin: CGFloat = 30.0
        var contentSize = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        for view in self.subviews {
            let lastPixel = view.frame.size.height + view.frame.origin.y
            if lastPixel > contentSize.height {
                contentSize.height = lastPixel
            }
        }
        contentSize.height += margin
        self.contentSize = contentSize
    }
}
