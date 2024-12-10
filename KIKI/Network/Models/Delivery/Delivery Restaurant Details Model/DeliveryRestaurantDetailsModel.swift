//
//  DeliveryRestaurantDetailsModel.swift
//  KIKI
//
//  Created by Fares Ajimi on 6/12/2021.
//

import Foundation

struct DeliveryRestaurantDetailsModel: Codable {

    let uuid: String?
    let name: String?
    let coverPicture: String?
    let logo: String?

    init(apiModel: DeliveryRestaurantDetailsAPIModel) {
        uuid = apiModel.uuid
        name = apiModel.name
        coverPicture = apiModel.coverPicture
        logo = apiModel.logo
    }
}
