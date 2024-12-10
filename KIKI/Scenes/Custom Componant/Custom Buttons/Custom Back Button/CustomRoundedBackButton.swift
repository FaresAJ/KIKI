//
//  CustomGrayBackButton.swift
//  KIKI
//
//  Created by Fares Ajimi on 21/12/2021.
//

import UIKit

@IBDesignable
class CustomRoundedBackButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }

    func setup() {
        let roundedBackButtonImage = UIImage(named: "RoundedBackButton")
        setImage(roundedBackButtonImage, for: .normal)
    }
}
