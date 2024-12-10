//
//  UserModel.swift
//  KIKI
//
//  Created by ons  on 29/12/2021.
//

import Foundation

struct UserModel {

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

    init(apiModel: UserAPIModel) {
        uuid = apiModel.uuid
        firstName = apiModel.firstName
        lastName = apiModel.lastName
        email = apiModel.email
        phone = apiModel.phone
        isPublic = apiModel.isPublic
        hasAccessToPickupService = apiModel.hasAccessToPickupService
        isActive = apiModel.isActive
        profilePicture = apiModel.profilePicture
        isDeleted = apiModel.isDeleted
        orderingStatus = apiModel.orderingStatus
        address = apiModel.address
        isSuspended = apiModel.isSuspended
    }
}
