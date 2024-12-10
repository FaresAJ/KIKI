//
//  CustomRestaurantDetailsHeaderView.swift
//  KIKI
//
//  Created by Fares Ajimi on 3/12/2021.
//

import UIKit

@IBDesignable
class CustomRestaurantDetailsHeaderView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

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

    // MARK: - Actions

    func display(restaurant: DeliveryRestaurantDetailsModel) {
        titleLabel.text = restaurant.name
        if let logoPath = restaurant.logo {
            logoImageView.setImageWithUrl(url: logoPath, placeholder: nil, radius: 0)
        }
        if let coverPicturePath = restaurant.coverPicture {
            coverImageView.setImageWithUrl(url: coverPicturePath, placeholder: nil, radius: 0)
        }
    }
}
