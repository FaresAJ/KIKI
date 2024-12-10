//
//  UITextFieldExtension.swift
//  KIKI
//
//  Created by Fares Ajimi on 1/12/2021.
//

import UIKit

extension UITextField {

    private var placeholderLabel: UILabel? { return value(forKey: "placeholderLabel") as? UILabel }

    private class Label: UILabel {
        private var _textColor = UIColor.lightGray
        override var textColor: UIColor! {
            get { return _textColor }
            set { super.textColor = _textColor }
        }

        init(label: UILabel, textColor: UIColor = .lightGray) {
            _textColor = textColor
            super.init(frame: label.frame)
            self.text = label.text
            self.font = label.font
        }

        required init?(coder: NSCoder) { super.init(coder: coder) }
    }

    func setPlaceholder(text: String, textColor: UIColor) {
        guard let placeholderLabel = placeholderLabel else { return }
        placeholderLabel.text = text
        let label = Label(label: placeholderLabel, textColor: textColor)
        setValue(label, forKey: "placeholderLabel")
    }
}

extension UITextField: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            placeholder = key?.localized
        }
    }
}
