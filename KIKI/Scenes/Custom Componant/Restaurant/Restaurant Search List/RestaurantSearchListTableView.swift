//
//  RestaurantSearchListTableView.swift
//  KIKI
//
//  Created by Fares Ajimi on 24/12/2021.
//

import UIKit
import SkeletonView

class RestaurantSearchListTableView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    var dataSource: RestaurantSearchListDataSource?

    // MARK: DI

    func set(dataSource: RestaurantSearchListDataSource) {
        self.dataSource = dataSource
    }

    func set(items: [RestaurantSearchModel]) {
        dataSource?.set(items: items)
        tableView.reloadData()
    }

    // MARK: View life cycle

    override func draw(_ rect: CGRect) {
        setUpTableView()
    }

    // MARK: UI

    func setUpTableView() {
        tableView.dataSource = dataSource
        tableView.register(RestaurantSearchListTableViewCell.nib,
                           forCellReuseIdentifier: RestaurantSearchListTableViewCell.identifier)
    }

    // MARK: Actions

    func showAnimatedSkeleton() {
        tableView.showAnimatedGradientSkeleton()
    }

    func hideAnimatedSkeleton() {
        tableView.hideSkeleton()
    }
}
