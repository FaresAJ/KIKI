//
//  CustomNextButtonWithPinkBorder.swift
//  KIKI
//
//  Created by Fares Ajimi on 7/12/2021.
//

import UIKit

class CustomNextButtonWithPinkBorder: UIButton {

    // MARK: - Properties

    let spinner = UIActivityIndicatorView()

    // MARK: - Init

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .white
        self.borderWidth = 2
        self.borderColor = UIColor.init(named: "white")
        self.cornerRadius = self.frame.height / 2
        self.semanticContentAttribute = .forceRightToLeft
        self.tintColor = UIColor.init(named: "white")
        setTitleColor()
    }

    func setTitle(_ title: String?) {
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .disabled)
        self.setTitle(title, for: .focused)
        self.setTitle(title, for: .highlighted)
        self.setTitle(title, for: .selected)
    }

    func setTitleColor() {
        self.setTitleColor(UIColor(named: "white"), for: .disabled)
        self.setTitleColor(UIColor(named: "pink"), for: .normal)
        self.setTitleColor(UIColor(named: "pink"), for: .focused)
        self.setTitleColor(UIColor(named: "pink"), for: .highlighted)
        self.setTitleColor(UIColor(named: "pink"), for: .selected)
    }

    func set(enabled: Bool) {
        if enabled {
            self.tintColor = UIColor.init(named: "pink")
            self.borderColor = UIColor.init(named: "pink")
            isEnabled = true
        } else {
            self.tintColor = UIColor.init(named: "white")
            self.borderColor = UIColor.init(named: "white")
            isEnabled = false
        }
    }

    func isLoading(_ loading: Bool) {
        if loading == true {
            spinner.isUserInteractionEnabled = false
            spinner.translatesAutoresizingMaskIntoConstraints = false
            addSubview(spinner)
            // swiftlint:disable line_length
            addSpinnerConstraints()
            spinner.color = UIColor.init(named: "pink")
            spinner.startAnimating()
            spinner.alpha = 0
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.spinner.alpha = 1
                self.tintColor = UIColor.init(white: 1, alpha: 0)
                self.layoutIfNeeded()
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                for subview in self.subviews where subview is UIActivityIndicatorView {
                    subview.removeFromSuperview()
                }
            }, completion: nil)
            self.tintColor = UIColor.init(named: "pink")
        }
    }

    private func  addSpinnerConstraints() {
        let trailingConstraint = NSLayoutConstraint(item: spinner, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 40)
        let verticalConstraint = NSLayoutConstraint(item: spinner, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: spinner, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20)
        let heightConstraint = NSLayoutConstraint(item: spinner, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20)
        self.addConstraints([verticalConstraint, widthConstraint, heightConstraint, trailingConstraint])
    }
}
