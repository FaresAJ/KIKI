//
//  CustomIconsButton.swift
//  KIKI
//
//  Created by ons  on 3/1/2022.
//

import UIKit

@IBDesignable
class CustomIconsButton: UIButton {

    @IBInspectable var leftHandImage: UIImage? {
        didSet {
            leftHandImage = leftHandImage?.withRenderingMode(.alwaysOriginal)
            setupImages()
        }
    }
    @IBInspectable var color: UIColor? {
        didSet {
            setupImages()
        }
    }
    @IBInspectable var rightHandImage: UIImage? {
        didSet {
            rightHandImage = rightHandImage?.withRenderingMode(.alwaysTemplate)
            setupImages()
        }
    }

    func setupImages() {
        if let leftImage = leftHandImage {
            self.setImage(leftImage, for: .normal)
            self.imageView?.contentMode = .scaleAspectFill
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0,
                                                bottom: 0, right: self.frame.width - (self.imageView?.frame.width)!)
        }
        if let rightImage = rightHandImage {
            let rightImageView = UIImageView(image: rightImage)
            rightImageView.tintColor = color

            let height = self.frame.height * 0.4
            let width = height
            let xPos = self.frame.width - width
            let yPos = (self.frame.height - height) / 2

            rightImageView.frame = CGRect(x: xPos + 3, y: yPos, width: width, height: height)
            self.addSubview(rightImageView)
        }
    }
}
