//
//  UserAPIModel.swift
//  KIKI
//
//  Created by ons  on 29/12/2021.
//

import Foundation

struct UserAPIModel: Codable {
    let uuid: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let phone: String?
    let isPublic: Bool?
    let hasAccessToPickupService: Bool?
    let isActive: Bool?
    let profilePicture: String?
    let isDeleted: Bool?
    let orderingStatus: String?
    let address: String?
    let isSuspended: Bool?

    enum CodingKeys: String, CodingKey {
        case uuid, email, phone, address
        case firstName = "first_name"
        case lastName = "last_name"
        case isPublic = "is_public"
        case hasAccessToPickupService = "has_access_to_pickup_service"
        case isActive = "is_active"
        case profilePicture = "profile_picture"
        case orderingStatus = "ordering_status"
        case isDeleted = "is_deleted"
        case isSuspended = "is_suspended"
    }
}
