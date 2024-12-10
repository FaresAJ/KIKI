//
//  DeliveryRestaurantDetailsAPIModel.swift
//  KIKI
//
//  Created by Fares Ajimi on 6/12/2021.
//

import Foundation

struct DeliveryRestaurantDetailsAPIModel: Codable {

    let uuid: String?
    let name: String?
    let coverPicture: String?
    let logo: String?

    private enum CodingKeys: String, CodingKey {
        case uuid
        case name
        case coverPicture = "profile_picture"
        case logo
    }
}
