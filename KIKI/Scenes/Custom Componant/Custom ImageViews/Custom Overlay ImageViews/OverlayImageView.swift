//
//  OverlayImageView.swift
//  KIKI
//
//  Created by ons  on 16/12/2021.
//

import Foundation
import UIKit

@IBDesignable
class OverlayImageView: UIImageView {

    // MARK: - Properties

    @IBInspectable
    var isOpen: Bool {
        get {
            return true
        }
        set {
            let image = UIImage(named: "black overlay")
            self.image = image
            self.isHidden = newValue
        }
    }

    var closedLabel: UILabel?
    var backView: UIView?

    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backView?.center = self.center
    }

    func setUpView() {
        backView = UIView()
        backView?.frame = CGRect(x: 0, y: 0, width: 70, height: 27)
        backView?.backgroundColor = UIColor(named: "topaz - Three")
        backView?.cornerRadius = 7
        self.addSubview(backView!)
        closedLabel = UILabel()
        closedLabel?.frame = CGRect(x: 0, y: 0, width: 50, height: 15)
        closedLabel?.text = NSLocalizedString("closed", comment: "")
        closedLabel?.textColor = UIColor(named: "white - Four")
        closedLabel?.font = UIFont(name: "Poppins-Regular", size: 10)
        closedLabel?.textAlignment = .center
        backView?.addSubview(closedLabel!)
        closedLabel?.center = backView!.center
    }

}
