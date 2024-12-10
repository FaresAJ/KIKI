//
//  OrderAgainListTableHeader.swift
//  KIVI
//
//  Created by ons  on 3/1/2022.
//

import UIKit

class OrderListTableHeader: UIView {

    // MARK: - Outlets

    @IBOutlet weak var orderAgainCollectionView: UICollectionView!
    @IBOutlet weak var ongoingOrdersCollectionView: UICollectionView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var orderAgainView: UIView!

    // MARK: - Properties

    var dataSource: OrderAgainDataSource?
    var ongoingOrdersDataSource: OrderListDataSource?

    // MARK: - DI

    func set(ongoingItems: [OrderModel]) {
        if ongoingItems.isEmpty {
            ongoingOrdersCollectionView.isHidden = true
        } else {
            ongoingOrdersDataSource?.items = ongoingItems
        }
    }

    func set(items: [OrderModel]) {
        if items.isEmpty {
            orderAgainView.isHidden = true
        } else {
            dataSource?.items = items
        }
    }

    func set(dataSource: OrderAgainDataSource) {
        self.dataSource = dataSource
    }

    func set(ongoingOrdersDataSource: OrderListDataSource) {
        self.ongoingOrdersDataSource = ongoingOrdersDataSource
    }

    // MARK: View life cycle

    override func draw(_ rect: CGRect) {
        setUpCollectionView()
    }

    // MARK: UI

    func setUpCollectionView() {
        orderAgainCollectionView.dataSource = dataSource
        orderAgainCollectionView.register(OrderAgainCollectionViewCell.nib,
                                forCellWithReuseIdentifier: OrderAgainCollectionViewCell.identifier)
        ongoingOrdersCollectionView.dataSource = ongoingOrdersDataSource
        ongoingOrdersCollectionView.register(OrderListCollectionViewCell.nib,
                                forCellWithReuseIdentifier: OrderListCollectionViewCell.identifier)
    }

}
