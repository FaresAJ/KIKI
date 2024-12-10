//
//  CustomCornerTabar.swift
//  KIKI
//
//  Created by Fares Ajimi on 8/12/2021.
//  Copyright © 2021 Yosr. All rights reserved.
//

import UIKit

@IBDesignable class CustomCornerTabar: UITabBar {
    @IBInspectable var color: UIColor?
    @IBInspectable var radius: CGFloat = 18.0

    private var shapeLayer: CALayer?

    override func draw(_ rect: CGRect) {
        addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        shapeLayer.fillColor = color?.cgColor ?? UIColor.black.cgColor
        shapeLayer.lineWidth = 4
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: -3)
        shapeLayer.shadowOpacity = 0.2
        shapeLayer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }

    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radius, height: 0.0))

        return path.cgPath
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        var tabFrame            = self.frame
        tabFrame.size.height    = 52 + (keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero)
        tabFrame.origin.y       = self.frame.origin.y + (self.frame.height - 52 -
                                                         (keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero))
        self.layer.cornerRadius = 20
        self.frame              = tabFrame
        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })
    }
}
