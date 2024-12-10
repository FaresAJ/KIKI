//
//  OrderListCollectionViewCell.swift
//  KIKI
//
//  Created by ons  on 31/12/2021.
//

import UIKit

class OrderListCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var restaurantNameLabel: UILabel!

    // MARK: - Properties

    static let identifier = "orderListCollectionViewCell"
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
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "Track delivery")!)
    }

    // MARK: - Actions

    func configure(_ orderCollection: OrderModel) {
        restaurantNameLabel.text = orderCollection.place?.name
    }
}
