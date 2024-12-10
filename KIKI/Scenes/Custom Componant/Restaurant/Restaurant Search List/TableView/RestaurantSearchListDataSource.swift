//
//  RestaurantSearchListDataSource.swift
//  KIKI
//
//  Created by Fares Ajimi on 24/12/2021.
//

import UIKit
import SkeletonView

class RestaurantSearchListDataSource: NSObject, UITableViewDataSource {

    // MARK: - Properties

    private var items: [RestaurantSearchModel] = []

    // MARK: - DI

    func set(items: [RestaurantSearchModel]) {
        self.items = items
    }

//    func append(items: [DeliveryRestaurantCardModel]) {
//        self.items.append(contentsOf: items)
//    }
//
//    func item(at index: Int) -> DeliveryRestaurantCardModel {
//        return items[index]
//    }

    // MARK: - TableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RestaurantSearchListTableViewCell.identifier,
            for: indexPath
        ) as? RestaurantSearchListTableViewCell else {
            return .init()
        }

        let item = items[indexPath.row]
        cell.configure(restaurant: item)
        return cell
    }
}

// MARK: - TableView Skeleton loader

extension RestaurantSearchListDataSource: SkeletonTableViewDataSource {

    func collectionSkeletonView(_ skeletonView: UITableView,
                                cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return RestaurantSearchListTableViewCell.identifier
    }
    func collectionSkeletonView(_ skeletonView: UITableView,
                                numberOfRowsInSection section: Int) -> Int {
        return 8
    }
}
