//
//  RatingView.swift
//  KIKI
//
//  Created by ons  on 16/12/2021.
//

import Foundation
import SwiftUI

@IBDesignable
class RatingView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var ratingLabel: UILabel!

    // MARK: - Properties

    @IBInspectable var nibName: String?
    var contentView: UIView?

    // MARK: - Init & loading view

    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }

    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask =
                    [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }

    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
                withOwner: self,
                options: nil).first as? UIView
    }

    // MARK: - Action

    func setUpRating(rating: String) {
        ratingLabel?.text = rating
    }
}
