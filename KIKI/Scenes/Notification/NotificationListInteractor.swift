//
//  NotificationListInteractor.swift
//  KIKI
//
//  Created by ons  on 21/12/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Combine

protocol NotificationListInteractorProtocol: AnyObject {
    func fetchNotifications(limit: Int, offset: Int)
}

class NotificationListInteractor: NotificationListInteractorProtocol {

    // MARK: - Properties

    private let presenter: NotificationListPresenterProtocol
    private var cancellableSet = Set<AnyCancellable>()
    private let persistenceManager: PersistenceManagerProtocol
    private let notificationsService: NotificationsServiceProtocol

    // MARK: - DI

    init(
        presenter: NotificationListPresenterProtocol,
        notificationsService: NotificationsServiceProtocol,
        persistenceManager: PersistenceManagerProtocol) {
            self.presenter = presenter
            self.notificationsService = notificationsService
            self.persistenceManager = persistenceManager
    }

    // MARK: - Actions

    func fetchNotifications(limit: Int, offset: Int) {
        notificationsService.fetchNotificationList(limit: limit, offset: offset)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    debugPrint(error)
                    ConnectivityMananger
                        .shared()
                        .$isConnected
                        .sink(receiveValue: { [weak self] (isConnected) in
                            if isConnected == false {
                                self?.fetchCachedNotifications()
                            }
                        }).cancel()
                case .finished:
                    debugPrint("Notification list fetched from database")
                }
            }, receiveValue: { [weak self] notificationsList in
                self?.persistenceManager.saveObjects(notificationsList)
                self?.presenter.presentNotificationList(notifications: notificationsList)
            })
            .store(in: &self.cancellableSet)
    }

    func fetchCachedNotifications() {
        if let cachedNotifications = persistenceManager.fetchObjects(
            NotificationRealmObject.self,
            resultType: NotificationAPIModel.self), cachedNotifications.count > 0 {
            presenter.presentNotificationList(notifications: cachedNotifications)
        }
    }
}
