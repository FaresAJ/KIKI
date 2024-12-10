//
//  UISearchBarExtension.swift
//  KIKI
//
//  Created by ons  on 23/12/2021.
//

import UIKit

extension UISearchBar: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            placeholder = key?.localized
        }
    }
}
