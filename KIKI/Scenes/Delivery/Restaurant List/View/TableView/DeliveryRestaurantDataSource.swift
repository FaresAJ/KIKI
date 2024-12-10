//
//  DeliveryRestaurantDataSource.swift
//  KIKI
//
//  Created by Fares Ajimi on 12/11/2021.
//

import UIKit
import SkeletonView

class DeliveryRestaurantDataSource: NSObject, UITableViewDataSource {

    // MARK: - Properties

    private var items: [DeliveryRestaurantCardModel] = []

    // MARK: - DI

    func set(items: [DeliveryRestaurantCardModel]) {
        self.items = items
    }
    func append(items: [DeliveryRestaurantCardModel]) {
        self.items.append(contentsOf: items)
    }

    func item(at index: Int) -> DeliveryRestaurantCardModel {
        return items[index]
    }

    // MARK: - TableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DeliveryRestaurantListTableViewCell.identifier,
            for: indexPath
        ) as? DeliveryRestaurantListTableViewCell else {
            return .init()
        }

        let item = items[indexPath.row]
        cell.configure(restaurant: item)
        return cell
    }
}

// MARK: - TableView Skeleton loader

extension DeliveryRestaurantDataSource: SkeletonTableViewDataSource {

    func collectionSkeletonView(_ skeletonView: UITableView,
                                cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return DeliveryRestaurantListTableViewCell.identifier
    }
    func collectionSkeletonView(_ skeletonView: UITableView,
                                numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}
