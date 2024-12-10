//
//  BlueGradiantOverlayImageView.swift
//  KIKI
//
//  Created by Fares Ajimi on 20/12/2021.
//

import UIKit

class BlueGradiantOverlayImageView: UIImageView {

    // MARK: - Properties

    struct BlueGradiantOverlayColors {
        static let GradientColor1 = UIColor(red: 28/255, green: 42/255, blue: 117/255, alpha: 0.91)
        static let GradientColor2 = UIColor(red: 80/255, green: 91/255, blue: 149/255, alpha: 0.61)
        static let GradientColor3 = UIColor(red: 125/255, green: 133/255, blue: 176/255, alpha: 0.42)
        static let GradientColor4 = UIColor(red: 183/255, green: 187/255, blue: 211/255, alpha: 0.22)
        static let GradientColor5 = UIColor(red: 253/255, green: 253/255, blue: 253/255, alpha: 0.01)
        static let GradientColor6 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.0)
    }

    // MARK: - UI

    func setBlueGradiantOverlay() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            BlueGradiantOverlayColors.GradientColor1.cgColor,
            BlueGradiantOverlayColors.GradientColor2.cgColor,
            BlueGradiantOverlayColors.GradientColor3.cgColor,
            BlueGradiantOverlayColors.GradientColor4.cgColor,
            BlueGradiantOverlayColors.GradientColor5.cgColor,
            BlueGradiantOverlayColors.GradientColor6.cgColor
        ]
        gradientLayer.locations = [0, 0.2, 0.4, 0.5, 0.7, 0, 8, 1]
        gradientLayer.opacity = 1
        gradientLayer.apply(angle: 45.0)
        layer.insertSublayer(gradientLayer, at: 0)
        layer.name = "blueGradiantOverlay"
    }

    // MARK: - Init & loading view

    override init(frame: CGRect) {
        super.init(frame: frame)
        setBlueGradiantOverlay()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setBlueGradiantOverlay()
    }
}
