//
//  LoginAssembly.swift
//  KIKI
//
//  Created by ons  on 27/12/2021.
//

import UIKit
import Swinject
import SwinjectAutoregistration

class LoginAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: - SignIn DI

        container.autoregister(SignInInteractorProtocol.self,
                                initializer: SignInInteractor.init)
        container.autoregister(SignInPresenterProtocol.self,
                                initializer: SignInPresenter.init)

        container.register(SignInViewControllerProtocol.self) { resolver in
            let view = SignInViewController()

            let interactor = resolver.resolve(SignInInteractorProtocol.self)
            let presenter = resolver.resolve(SignInPresenterProtocol.self)

            view.interactor = interactor
            presenter?.view = view

            return view
        }
    }

}
