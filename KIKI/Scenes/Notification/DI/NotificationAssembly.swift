//
//  NotificationAssembly.swift
//  KIKI
//
//  Created by ons  on 21/12/2021.
//

import UIKit
import Swinject
import SwinjectAutoregistration

class NotificationAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: - NotificationList DI

        container.autoregister(NotificationListInteractorProtocol.self,
                               initializer: NotificationListInteractor.init)
        container.autoregister(NotificationListPresenterProtocol.self,
                               initializer: NotificationListPresenter.init)

        container.register(NotificationListViewControllerProtocol.self) { resolver in
            let view = NotificationListViewController()

            let interactor = resolver.resolve(NotificationListInteractorProtocol.self)
            let presenter = resolver.resolve(NotificationListPresenterProtocol.self)

            presenter?.view = view
            view.dataSource = NotificationListDataSource()
            view.interactor = interactor

            return view
        }
    }

}
