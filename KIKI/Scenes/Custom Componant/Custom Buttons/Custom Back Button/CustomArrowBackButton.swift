//
//  CustomArrowBackButton.swift
//  KIKI
//
//  Created by Fares Ajimi on 3/12/2021.
//

import UIKit

class CustomArrowBackButton: UIButton {

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let arrowBackButton = UIImage(named: "ArrowBackButton")
        self.setBackgroundImage(arrowBackButton, for: .normal)
        self.setBackgroundImage(arrowBackButton, for: .disabled)
        self.setBackgroundImage(arrowBackButton, for: .focused)
        self.setBackgroundImage(arrowBackButton, for: .highlighted)
        self.setBackgroundImage(arrowBackButton, for: .selected)
        self.setTitle("", for: .normal)
        self.setTitle("", for: .disabled)
        self.setTitle("", for: .focused)
        self.setTitle("", for: .highlighted)
        self.setTitle("", for: .selected)
    }
}
