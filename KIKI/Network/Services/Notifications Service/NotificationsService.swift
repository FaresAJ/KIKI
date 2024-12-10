//
//  NotificationsService.swift
//  KIKI
//
//  Created by ons  on 21/12/2021.
//

import Alamofire
import Combine
import Moya

protocol NotificationsServiceProtocol: AnyObject {
    func fetchNotificationList(limit: Int, offset: Int)
    -> AnyPublisher<[NotificationAPIModel], MoyaError>
}

class NotificationsService: NotificationsServiceProtocol {

    private let provider = MoyaProvider<NotificationsMoyaService>(
        plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

    // MARK: - Functions

    func fetchNotificationList(limit: Int, offset: Int)
    -> AnyPublisher<[NotificationAPIModel], MoyaError> {
        return provider.requestPublisher(.fetchNotificationList(limit: limit, offset: offset))
            .map([NotificationAPIModel].self)
    }
}
