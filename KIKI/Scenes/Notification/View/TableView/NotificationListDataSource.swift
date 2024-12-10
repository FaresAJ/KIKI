//
//  NotificationListDataSource.swift
//  KIKI
//
//  Created by ons  on 21/12/2021.
//

import UIKit
import SkeletonView

class NotificationListDataSource: NSObject, UITableViewDataSource {

    // MARK: - Properties

    private var items: [NotificationModel] = []

    // MARK: - DI

    func set(items: [NotificationModel]) {
        self.items = items
    }

    func append(items: [NotificationModel]) {
        self.items.append(contentsOf: items)
    }

    // MARK: - TableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NotificationListTableViewCell.identifier,
            for: indexPath
        ) as? NotificationListTableViewCell else {
            return .init()
        }

        let item = self.items[indexPath.row]
        cell.configure(notification: item)
        return cell
    }

}

// MARK: - TableView Skeleton loader

extension NotificationListDataSource: SkeletonTableViewDataSource {

    func collectionSkeletonView(_ skeletonView: UITableView,
                                cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return NotificationListTableViewCell.identifier
    }
    func collectionSkeletonView(_ skeletonView: UITableView,
                                numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
