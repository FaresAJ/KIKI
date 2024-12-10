//
//  DeliveryRestaurantListTableViewCell.swift
//  KIKI
//
//  Created by Fares Ajimi on 11/11/2021.
//

import UIKit

class DeliveryRestaurantListTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var minimumOrderPriceLabel: UILabel!
    @IBOutlet weak var distanceLocationLabel: UILabel!
    @IBOutlet weak var ratingCountLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var deliveryTimeEstimateContainerView: UIView!
    @IBOutlet weak var deliveryDiscountContainerView: UIView!
    @IBOutlet weak var deliveryTimeEstimationLabel: UILabel!
    @IBOutlet weak var overlayImageView: OverlayImageView!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var discountIconImageView: UIImageView!
    @IBOutlet weak var discountTitleLabel: UILabel!
    @IBOutlet weak var discountExpireLabel: UILabel!

    // MARK: - Properties

    static let identifier = "deliveryRestaurantListCell"
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
        containerView.dropShadow()
        deliveryTimeEstimateContainerView.roundCorners(corners: [.layerMinXMaxYCorner, .layerMinXMinYCorner],
                                                       radius: 8)
        deliveryDiscountContainerView.roundCorners(corners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner],
                                                   radius: 8)
    }

    // MARK: - Actions

    func configure(restaurant: DeliveryRestaurantCardModel) {
        titleLabel.text = restaurant.name
        specialityLabel.text = restaurant.specialties
        if let logoPath = restaurant.logoPath {
            coverImageView.setImageWithUrl(url: logoPath, placeholder: nil, radius: 0)
        }
        minimumOrderPriceLabel.text = restaurant.minimumOrderPrice
        distanceLocationLabel.text = restaurant.distance
        if let reviewsCount = restaurant.reviewsCount {
            ratingCountLabel.text = "(\(reviewsCount))"
        }
        let favoriteButtonImageName = restaurant.isFavorite ? "Favorite icon checked" : "Favorite icon unchecked"
        favoriteButton.setImage(UIImage(named: favoriteButtonImageName), for: .normal)
        if let deliveryTimeEstimation = restaurant.deliveryTimeEstimation {
            deliveryTimeEstimationLabel.text = getDeliveryTimeRangeEstimate(deliveryMaxTime: deliveryTimeEstimation)
        }
        if let isOpen = restaurant.isOpen {
            overlayImageView.isOpen = isOpen
            deliveryTimeEstimateContainerView.isHidden = !isOpen
        }
        if let rating = restaurant.rating {
            ratingView.setUpRating(rating: String(format: "%.1f", rating))
        }
        deliveryDiscountContainerView.isHidden = (restaurant.specialOffer == nil)
        discountIconImageView.isHidden = (restaurant.specialOffer == nil)
        if let specialOffer = restaurant.specialOffer {
            discountTitleLabel.text = specialOffer.description
            discountExpireLabel.text = specialOffer.expirationTime
            if let offerImageName = specialOffer.offerImageName {
                discountIconImageView.image = UIImage(named: offerImageName)
            }
            if let expirationBannerColor = specialOffer.expirationBannerColor {
                deliveryDiscountContainerView.backgroundColor = expirationBannerColor
            }
        }
    }

    func getDeliveryTimeRangeEstimate(deliveryMaxTime: Int) -> String {
        if deliveryMaxTime > 10 {
            return "\(deliveryMaxTime - 10) - \(deliveryMaxTime) min"
        } else {
            return "\(deliveryMaxTime) min"
        }
    }

    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
    }

}
