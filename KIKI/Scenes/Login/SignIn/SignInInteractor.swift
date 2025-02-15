//
//  SignInInteractor.swift
//  KIVI
//
//  Created by ons  on 27/12/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Combine
import SwiftKeychainWrapper
import JWTDecode

protocol SignInInteractorProtocol: AnyObject {
    func loginUser(email: String, password: String)
}

class SignInInteractor: SignInInteractorProtocol {

    // MARK: - Properties

    private let presenter: SignInPresenterProtocol
    private var cancellableSet = Set<AnyCancellable>()
    private let usersService: UsersServiceProtocol

    // MARK: - DI

    init (
        presenter: SignInPresenterProtocol,
        usersService: UsersServiceProtocol) {
            self.presenter = presenter
            self.usersService = usersService
        }

    // MARK: - Actions

    func loginUser(email: String, password: String) {
        usersService.loginUser(email: email, password: password)
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    debugPrint(error)
                case .finished:
                    debugPrint("User Logged In")
                }
            }, receiveValue: { [weak self] userLogin in
                // TODO: - JWT Fixing
                if let value = userLogin.value {
                    self?.presenter.presentLogin(error: value)
                } else if let token = userLogin.token {
                    do {
                        let jwt = try decode(jwt: token as String)
                        let data = jwt.body
                        let uuid = data["uuid"] as? String
                        let _: Bool = KeychainWrapper.standard.set(uuid!, forKey: "uuid")
                    } catch {
                        print("error")
                    }
                    let saveSuccessful: Bool = KeychainWrapper.standard.set(token, forKey: "token")
                    saveSuccessful ? self?.presenter.presentLoginSuccess() : self?.presenter.presentLogin(error: "")
                }
            })
            .store(in: &self.cancellableSet)
    }
}
