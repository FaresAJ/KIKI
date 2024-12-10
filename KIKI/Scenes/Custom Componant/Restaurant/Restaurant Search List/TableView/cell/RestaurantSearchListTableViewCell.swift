//
//  RestaurantSearchListTableViewCell.swift
//  KIKI
//
//  Created by Fares Ajimi on 24/12/2021.
//

import UIKit

class RestaurantSearchListTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var restaurantLogoImageView: UIImageView!
    @IBOutlet weak var restaurantTitleLabel: UILabel!
    @IBOutlet weak var restaurantAddressLabel: UILabel!

    // MARK: - Properties

    static let identifier = "RestaurantSearchListTableViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }

    // MARK: - UITableViewCell lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }

    // MARK: - UI

    func setUpUI() {
        restaurantLogoImageView.dropShadow()
    }

    // MARK: - Actions

    func configure(restaurant: RestaurantSearchModel) {
        if let imagePath = restaurant.logo {
            restaurantLogoImageView.setImageWithUrl(url: imagePath, placeholder: nil, radius: 0)
        }
        restaurantTitleLabel.text = restaurant.name
        restaurantAddressLabel.text = restaurant.address
    }
}
