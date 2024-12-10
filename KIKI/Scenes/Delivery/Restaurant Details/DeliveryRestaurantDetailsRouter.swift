//
//  DeliveryRestaurantDetailsRouter.swift
//  KIKI
//
//  Created by Fares Ajimi on 21/12/2021.
//

import UIKit
import Swinject

protocol DeliveryRestaurantDetailsRouterProtocol: AnyObject {
    var view: DeliveryRestaurantDetailsViewControllerProtocol? { get set }
    var resolver: Resolver? { get set }
    func route(to scene: DeliveryRestaurantDetailsRouter.Scene)
}

class DeliveryRestaurantDetailsRouter: DeliveryRestaurantDetailsRouterProtocol {

    // MARK: - Properties

    weak var view: DeliveryRestaurantDetailsViewControllerProtocol?
    var resolver: Resolver?

    enum Scene {
        case deliveryRestaurantList
     }

    // MARK: - Routing

    func route(to scene: DeliveryRestaurantDetailsRouter.Scene) {
        switch scene {
        case .deliveryRestaurantList:
            view?.popViewController(animated: true)
        }
    }
}
