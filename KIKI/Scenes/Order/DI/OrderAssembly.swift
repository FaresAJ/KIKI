//
//  OrderAssembly.swift
//  KIKI
//
//  Created by ons  on 31/12/2021.
//

import UIKit
import Swinject
import SwinjectAutoregistration

class OrderAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: OrderList DI

        container.autoregister(OrderListInteractorProtocol.self,
                               initializer: OrderListInteractor.init)
        container.autoregister(OrderListPresenterProtocol.self,
                               initializer: OrderListPresenter.init)

        container.register(OrderListViewControllerProtocol.self) { resolver in
            let view = OrderListViewController()

            let interactor = resolver.resolve(OrderListInteractorProtocol.self)
            let presenter = resolver.resolve(OrderListPresenterProtocol.self)

            presenter?.view = view
            view.deliveryRestaurantDataSource = DeliveryRestaurantDataSource()
            view.dataSource = OrderAgainDataSource()
            view.ongoingOrdersDataSource = OrderListDataSource()
            view.interactor = interactor

            return view
        }
    }
}
