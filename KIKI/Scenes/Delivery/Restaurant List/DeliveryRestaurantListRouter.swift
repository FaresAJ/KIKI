//
//  DeliveryRestaurantListRouter.swift
//  KIKI
//
//  Created by Fares Ajimi on 2/12/2021.
//

import UIKit
import Swinject

protocol DeliveryRestaurantListRouterProtocol: AnyObject {
    var view: DeliveryRestaurantListViewControllerProtocol? { get set }
    var resolver: Resolver? { get set }
    func route(to scene: DeliveryRestaurantListRouter.Scene)
}

class DeliveryRestaurantListRouter: DeliveryRestaurantListRouterProtocol {

    // MARK: - Properties

    weak var view: DeliveryRestaurantListViewControllerProtocol?
    var resolver: Resolver?

    enum Scene {
        case deliveryRestaurantDetails(uuid: String)
        case mapLocationPicker
     }

    // MARK: - Routing

    func route(to scene: DeliveryRestaurantListRouter.Scene) {
        switch scene {
        case .deliveryRestaurantDetails(uuid: let uuid):
            guard let restaurantDetailsViewController = resolver?
                    .resolve(DeliveryRestaurantDetailsViewControllerProtocol.self)! else { return }
            restaurantDetailsViewController.set(uuid: uuid)
            guard let restaurantDetailsViewController = restaurantDetailsViewController
                    as? UIViewController else { return }
            view?.pushViewController(restaurantDetailsViewController, animated: true)
        case .mapLocationPicker:
            guard let mapLocationPickerViewController = resolver?
                    .resolve(MapLocationPickerViewControllerProtocol.self)! else { return }
            guard let mapLocationPickerViewController = mapLocationPickerViewController
                    as? UIViewController else { return }
            view?.pushViewController(mapLocationPickerViewController, animated: true)
        }
    }
}
