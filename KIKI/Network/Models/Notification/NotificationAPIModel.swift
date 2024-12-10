//
//  NotificationAPIModel.swift
//  KIKI
//
//  Created by ons  on 21/12/2021.
//

import Foundation

struct NotificationAPIModel: Codable, Persistable {

    typealias ManagedObject = NotificationRealmObject

    let uuid: String?
    let description: String?
    let receiver: String?
    let notificationType: String?
    let isRead: Bool?
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case uuid, description
        case receiver = "receiver_uuid"
        case notificationType = "notification_type"
        case isRead = "is_read"
        case createdAt = "created_at"
    }

    init(managedObject: NotificationRealmObject) {
        uuid = managedObject.uuid
        description = managedObject.descriptionNotification
        receiver = managedObject.receiver
        notificationType = managedObject.notificationType
        isRead = managedObject.isRead
        createdAt = managedObject.createdAt
    }

    func managedObject() -> NotificationRealmObject {
        let realmObject = NotificationRealmObject()
        realmObject.uuid = uuid
        realmObject.descriptionNotification = description
        realmObject.receiver = receiver
        realmObject.notificationType = notificationType
        if let isRead = isRead {
            realmObject.isRead = isRead
        }
        realmObject.createdAt = createdAt
        return realmObject
    }
}
