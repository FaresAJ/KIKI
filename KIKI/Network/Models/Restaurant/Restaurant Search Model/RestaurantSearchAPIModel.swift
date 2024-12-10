//
//  RestaurantSearchAPIModel.swift
//  KIKI
//
//  Created by Fares Ajimi on 27/12/2021.
//

import Foundation

struct RestaurantSearchAPIModel: Codable {

    let uuid: String?
    let name: String?
    let logo: String?
    let address: String?

    private enum CodingKeys: String, CodingKey {
        case uuid, name, logo, address
    }
}
