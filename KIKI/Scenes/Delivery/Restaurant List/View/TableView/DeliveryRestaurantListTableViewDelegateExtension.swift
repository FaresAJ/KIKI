//
//  DeliveryRestaurantListTableViewDelegateExtension.swift
//  KIKI
//
//  Created by Fares Ajimi on 12/11/2021.
//

import UIKit

extension DeliveryRestaurantListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let uuid = dataSource?.item(at: indexPath.row).uuid else { return }
        router?.route(to: .deliveryRestaurantDetails(uuid: uuid))
    }
}
