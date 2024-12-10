//
//  CollectionCardHorizentalListViewCell.swift
//  KIKI
//
//  Created by Fares Ajimi on 9/12/2021.
//

import UIKit

class CollectionCardHorizentalListViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!

    // MARK: - Properties

    static let identifier = "CollectionCardHorizentalListViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }

    // MARK: - Actions

    func configure(_ restaurantCollection: RestaurantCollectionModel) {
        itemTitleLabel.text = restaurantCollection.label
        if let imagePath = restaurantCollection.image {
            itemImageView.setImageWithUrl(url: imagePath, placeholder: nil, radius: 0)
        }
    }
}
