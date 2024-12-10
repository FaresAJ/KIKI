//
//  CustomTextField.swift
//  KIKI
//
//  Created by ons  on 27/12/2021.
//

import UIKit
import SwiftUI

@IBDesignable
class CustomTextField: UITextField {

    // MARK: - Properties

    @IBInspectable
    var leftIcon: UIImage? {
        didSet {
            self.setUpTextView()
        }
    }
    @IBInspectable
    var rightIcon: UIImage? {
        didSet {
            self.setUpTextView()
        }
    }
    @IBInspectable
    var leftPadding: CGFloat = 0
    @IBInspectable
    var color: UIColor = UIColor.lightGray {
        didSet {
            self.setUpTextView()
        }
    }
    var bottomLine = CALayer()
    var contentView = UIView()

    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpTextView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 2.0)
    }

    func setUpTextView() {
        bottomLine.backgroundColor = UIColor(named: "white")?.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)

        if let image = leftIcon {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 19.9, height: 17.5))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            contentView.addSubview(imageView)
            contentView.frame = CGRect(x: 0, y: 0, width: 19.9 + leftPadding, height: 17.5)
            leftView = contentView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }

        if let image = rightIcon {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 2, width: 22, height: 13))
            let contentView = UIView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            contentView.addSubview(imageView)
            contentView.frame = CGRect(x: 0, y: frame.height / 2, width: 24 + 9, height: 13)
            rightView = contentView
            if image == UIImage(systemName: "eye") || image == UIImage(systemName: "eye.slash") {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideOrSHowPassword(_:)))
                contentView.addGestureRecognizer(tapGesture)
            }
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }

        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "",
                                                   attributes: [NSAttributedString.Key.foregroundColor: color])
    }

    // MARK: - Actions

    @objc
    func hideOrSHowPassword(_ sender: UIView) {
        if isSecureTextEntry {
            isSecureTextEntry = false
            rightIcon = UIImage(systemName: "eye.slash")
        } else {
            isSecureTextEntry = true
            rightIcon = UIImage(systemName: "eye")
        }
    }
}
