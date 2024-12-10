//
//  CustomCheckbox.swift
//  KIKI
//
//  Created by ons  on 27/12/2021.
//

import UIKit

@IBDesignable
class CustomCheckBox: UIButton {

    // MARK: - Properties

    @IBInspectable
    var checked: Bool = false {
        didSet {
            setUpCheckBox()
        }
    }
    @IBInspectable
    var text: String? {
        didSet {
            setUpCheckBox()
        }
    }
    @IBInspectable
    var checkBoxColor: UIColor? {
        didSet {
            setUpCheckBox()
        }
    }
    var label: UILabel?

    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCheckBox()
        self.addTarget(self, action: #selector(check), for: .allEvents)
    }

    func setUpCheckBox() {
        setTitle("", for: .selected)
        setTitle("", for: .normal)
        let boxView = UIView(frame: CGRect(x: 0, y: 0, width: 19, height: 19))
        boxView.isUserInteractionEnabled = false
        addSubview(boxView)
        if let text = text {
            label = UILabel(frame: CGRect(x: 19 + 14, y: 0, width: 350, height: 20))
            label?.textColor = UIColor(named: "darkIndigo")
            label?.font = UIFont(name: "Poppins-Regular", size: 14)
            label?.text = text
            addSubview(label!)
        }
        if checked {
            boxView.borderColor = checkBoxColor
            boxView.backgroundColor = checkBoxColor
            boxView.borderWidth = 1.5
            boxView.cornerRadius = 6
        } else {
            boxView.borderColor = UIColor(named: "white")
            boxView.backgroundColor = UIColor(white: 1, alpha: 1)
            boxView.borderWidth = 1.5
            boxView.cornerRadius = 6
        }
    }

    // MARK: - Actions

    func isChecked() -> Bool {
        return checked
    }

    @objc
    func check() {
        if isChecked() {
            checked = false
        } else {
            checked = true
        }
    }
}
