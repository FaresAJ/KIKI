//
//  OrderAgainCollectionViewCell.swift
//  KIKI
//
//  Created by ons  on 3/1/2022.
//

import UIKit

class OrderAgainCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
    @IBOutlet weak var rateButton: CustomIconsButton!
    @IBOutlet weak var reorderButton: CustomIconsButton!

    // MARK: - Properties

    static let identifier = "orderAgainCollectionViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }

    // MARK: - Actions

    func configure(_ orderCollection: OrderModel) {
        guard let restaurantName = orderCollection.place?.name else { return }
        restaurantNameLabel.text = restaurantName
        if orderCollection.itemsByQuantity.count == 1 {
            // swiftlint:disable line_length
            orderLabel.text = "\(String(describing: orderCollection.itemsByQuantity[0].quantity!))x \(orderCollection.itemsByQuantity[0].itemLabel ?? "")"
            moreLabel.text = ""
        } else if orderCollection.itemsByQuantity.count > 1 {
            orderLabel.text = "\(String(describing: orderCollection.itemsByQuantity[0].quantity!))x \(orderCollection.itemsByQuantity[0].itemLabel ?? "")"
            let sum = orderCollection.itemsByQuantity
                        .dropFirst()
                        .map({ $0.quantity! })
                        .reduce(0, +)
            moreLabel.text = "+\(sum) more"
        } else {
            moreLabel.text = ""
            orderLabel.text = ""
        }
    }
}
