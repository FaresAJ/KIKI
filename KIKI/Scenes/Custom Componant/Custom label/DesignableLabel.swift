//
//  DesignableLabel.swift
//  KIKI
//
//  Created by Fares Ajimi on 15/12/2021.
//

import UIKit

@IBDesignable
class DesignableLabel: UILabel {
    @IBInspectable
    var rotation: Int {
        get {
            return 0
        } set {
            let radians = ((CGFloat.pi) * CGFloat(newValue) / CGFloat(180.0))
            self.transform = CGAffineTransform(rotationAngle: radians)
        }
    }
}
