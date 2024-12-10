//
//  DeliveryRestaurantListTableHeader.swift
//  KIKI
//
//  Created by Fares Ajimi on 7/12/2021.
//

import UIKit

class DeliveryRestaurantListTableHeader: UIView {

    // MARK: - Outlets

    @IBOutlet weak var headersContainerStackView: UIStackView!
    @IBOutlet weak var collectionCardHorizentalListView: CollectionCardHorizentalListView!

    // MARK: DI

    func set(items: [RestaurantCollectionModel]) {
        collectionCardHorizentalListView.set(items: items)
    }

    func set(dataSource: CollectionCardHorizentalListDataSource) {
        collectionCardHorizentalListView.set(dataSource: dataSource)
    }
}
