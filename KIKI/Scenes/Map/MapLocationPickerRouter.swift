//
//  MapLocationPickerRouter.swift
//  KIKI
//
//  Created by Fares Ajimi on 30/12/2021.
//

import UIKit
import Swinject

protocol MapLocationPickerRouterProtocol: AnyObject {
    var view: MapLocationPickerViewControllerProtocol? { get set }
    var resolver: Resolver? { get set }
    func route(to scene: MapLocationPickerRouter.Scene)
}

class MapLocationPickerRouter: MapLocationPickerRouterProtocol {

    // MARK: - Properties

    weak var view: MapLocationPickerViewControllerProtocol?
    var resolver: Resolver?

    enum Scene {
        case deliveryRestaurantList
     }

    // MARK: - Routing

    func route(to scene: MapLocationPickerRouter.Scene) {
        switch scene {
        case .deliveryRestaurantList:
            view?.popViewController(animated: true)
        }
    }
}
