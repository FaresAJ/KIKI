//
//  CAGradientLayerExtension.swift
//  KIKI
//
//  Created by Fares Ajimi on 20/12/2021.
//

import UIKit

extension CAGradientLayer {
    func apply(angle: Double) {
        let angle: Double! = angle / 360.0
        let startPointX = pow(sinf(Float(2.0 * Double.pi * ((angle + 0.75) / 2.0))), 2.0)
        let startPointY = pow(sinf(Float(2*Double.pi*((angle+0.0)/2))), 2)
        let endPointX = pow(sinf(Float(2*Double.pi*((angle+0.25)/2))), 2)
        let endPointY = pow(sinf(Float(2*Double.pi*((angle+0.5)/2))), 2)
        startPoint = CGPoint(x: CGFloat(startPointX), y: CGFloat(startPointY))
        endPoint = CGPoint(x: CGFloat(endPointX), y: CGFloat(endPointY))
    }
}
