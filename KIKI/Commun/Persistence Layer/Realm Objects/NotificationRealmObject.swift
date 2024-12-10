//
//  NotificationRealmObject.swift
//  KIKI
//
//  Created by ons  on 21/12/2021.
//

import RealmSwift

final class NotificationRealmObject: Object {

    @objc dynamic var uuid: String?
    @objc dynamic var descriptionNotification: String?
    @objc dynamic var notificationType: String?
    @objc dynamic var isRead: Bool = false
    @objc dynamic var receiver: String?
    @objc dynamic var createdAt: String?

    override static func primaryKey() -> String? {
        return "uuid"
    }

}
