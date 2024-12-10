//
//  OrderAgainDataSource.swift
//  KIKI
//
//  Created by ons  on 3/1/2022.
//

import UIKit

class OrderAgainDataSource: NSObject, UICollectionViewDataSource {

    // MARK: - Properties

    var items: [OrderModel] = []

    // MARK: - DI

    func set(items: [OrderModel]) {
        self.items = items
    }

    // MARK: - CollectionView DataSource

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OrderAgainCollectionViewCell.identifier,
            for: indexPath
        ) as? OrderAgainCollectionViewCell else {
            return .init()
        }
        let item = items[indexPath.row]
        cell.configure(item)
        return cell
    }

}
