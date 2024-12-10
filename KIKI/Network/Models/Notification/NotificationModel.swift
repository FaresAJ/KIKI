//
//  NotificationModel.swift
//  KIKI
//
//  Created by ons  on 21/12/2021.
//

import Foundation

struct NotificationModel {

    let uuid: String?
    let description: String?
    let receiver: String?
    let notificationType: String?
    let isRead: Bool?
    let createdAt: String?

    init(apiModel: NotificationAPIModel, createdAt: String? = nil) {
        uuid = apiModel.uuid
        description = apiModel.description
        receiver = apiModel.receiver
        notificationType = apiModel.notificationType
        isRead = apiModel.isRead
        if let createdAt = createdAt {
            self.createdAt = createdAt
        } else {
            self.createdAt = ""
        }
    }
}
