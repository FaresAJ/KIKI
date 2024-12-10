//
//  DeliveryAssembly.swift
//  KIKI
//
//  Created by Fares Ajimi on 24/11/2021.
//

import UIKit
import Swinject
import SwinjectAutoregistration

class DeliveryAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: DeliveryRestaurantList DI
        container.autoregister(DeliveryRestaurantListRouterProtocol.self,
                               initializer: DeliveryRestaurantListRouter.init)
        container.autoregister(DeliveryRestaurantListInteractorProtocol.self,
                               initializer: DeliveryRestaurantListInteractor.init)
        container.autoregister(DeliveryRestaurantListPresenterProtocol.self,
                               initializer: DeliveryRestaurantListPresenter.init)

        container.register(DeliveryRestaurantListViewControllerProtocol.self) { resolver in
            let view = DeliveryRestaurantListViewController()

            let interactor = resolver.resolve(DeliveryRestaurantListInteractorProtocol.self)
            let presenter = resolver.resolve(DeliveryRestaurantListPresenterProtocol.self)
            let router = resolver.resolve(DeliveryRestaurantListRouterProtocol.self)

            router?.view = view
            router?.resolver = container
            presenter?.view = view
            view.dataSource = DeliveryRestaurantDataSource()
            view.set(dataSource: RestaurantSearchListDataSource())
            view.set(dataSource: CollectionCardHorizentalListDataSource())
            view.interactor = interactor
            view.router = router

            return view
        }

        // MARK: DeliveryRestaurantDetails DI
        container.autoregister(DeliveryRestaurantDetailsRouterProtocol.self,
                               initializer: DeliveryRestaurantDetailsRouter.init)
        container.autoregister(DeliveryRestaurantDetailsInteractorProtocol.self,
                               initializer: DeliveryRestaurantDetailsInteractor.init)
        container.autoregister(DeliveryRestaurantDetailsPresenterProtocol.self,
                               initializer: DeliveryRestaurantDetailsPresenter.init)

        container.register(DeliveryRestaurantDetailsViewControllerProtocol.self) { resolver in
            let view = DeliveryRestaurantDetailsViewController()

            let interactor = resolver.resolve(DeliveryRestaurantDetailsInteractorProtocol.self)
            let presenter = resolver.resolve(DeliveryRestaurantDetailsPresenterProtocol.self)
            let router = resolver.resolve(DeliveryRestaurantDetailsRouterProtocol.self)

            router?.view = view
            presenter?.view = view
            view.interactor = interactor
            view.router = router

            return view
        }
    }
}
