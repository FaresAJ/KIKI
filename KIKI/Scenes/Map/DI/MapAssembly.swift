//
//  MapAssembly.swift
//  KIKI
//
//  Created by Fares Ajimi on 31/12/2021.
//

import UIKit
import Swinject
import SwinjectAutoregistration

class MapAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: MapLocationPicker DI
        container.autoregister(MapLocationPickerRouterProtocol.self,
                               initializer: MapLocationPickerRouter.init)
//        container.autoregister(DeliveryRestaurantListInteractorProtocol.self,
//                               initializer: DeliveryRestaurantListInteractor.init)
//        container.autoregister(DeliveryRestaurantListPresenterProtocol.self,
//                               initializer: DeliveryRestaurantListPresenter.init)

        container.register(MapLocationPickerViewControllerProtocol.self) { resolver in
            let view = MapLocationPickerViewController()

//            let interactor = resolver.resolve(DeliveryRestaurantListInteractorProtocol.self)
//            let presenter = resolver.resolve(DeliveryRestaurantListPresenterProtocol.self)
            let router = resolver.resolve(MapLocationPickerRouterProtocol.self)

            router?.view = view
            router?.resolver = container
//            presenter?.view = view
//            view.interactor = interactor
            view.router = router

            return view
        }
    }
}
