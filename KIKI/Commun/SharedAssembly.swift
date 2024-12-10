//
//  SharedAssembly.swift
//  KIKI
//
//  Created by Fares Ajimi on 29/11/2021.
//

import Swinject
import SwinjectAutoregistration

class SharedAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: - TabBar
        container.register(TabBarViewControllerProtocol.self) { resolver in
            let tabBar = TabBarViewController.instantiateFromNib()
            tabBar.resolver = container
            return tabBar
        }

        // MARK: - Persistence manager
        container.autoregister(PersistenceManagerProtocol.self,
                               initializer: PersistenceManager.init)

        // MARK: - Places Service
        container.autoregister(PlacesServiceProtocol.self,
                               initializer: PlacesService.init)

        // MARK: - Notifications Service
        container.autoregister(NotificationsServiceProtocol.self,
                               initializer: NotificationsService.init)

        // MARK: - Users Service
        container.autoregister(UsersServiceProtocol.self,
                               initializer: UsersService.init)

        // MARK: - Orders Service
        container.autoregister(OrdersServiceProtocol.self,
                               initializer: OrdersService.init)

        // MARK: - Time Formatter
        container.autoregister(TimeFormatterProtocol.self,
                               initializer: TimeFormatter.init)
    }
}
