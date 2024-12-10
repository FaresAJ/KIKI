//
//  UsersService.swift
//  KIKI
//
//  Created by ons  on 28/12/2021.
//

import Alamofire
import Combine
import SwiftKeychainWrapper
import Moya

protocol UsersServiceProtocol: AnyObject {
    func loginUser(email: String, password: String)
    -> AnyPublisher<UserLoginAPIModel, MoyaError>
}

class UsersService: UsersServiceProtocol {

    private let provider = MoyaProvider<UsersMoyaService>(
        plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

    // MARK: - Functions

    func loginUser(email: String, password: String)
    -> AnyPublisher<UserLoginAPIModel, MoyaError> {
        return provider.requestPublisher(.loginUser(email: email, password: password))
            .map(UserLoginAPIModel.self)
    }
}
