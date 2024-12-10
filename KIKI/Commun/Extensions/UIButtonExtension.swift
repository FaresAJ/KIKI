//
//  UIButtonExtension.swift
//  KIKI
//
//  Created by ons  on 23/12/2021.
//

import UIKit

extension UIButton: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.localized, for: .normal)
        }
    }
}

extension CustomCheckBox {
    @IBInspectable override var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}
