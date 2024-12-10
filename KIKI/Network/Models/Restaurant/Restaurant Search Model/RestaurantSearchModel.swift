//
//  RestaurantSearchModel.swift
//  KIKI
//
//  Created by Fares Ajimi on 27/12/2021.
//

import Foundation

struct RestaurantSearchModel: Codable {

    let uuid: String?
    let name: String?
    let logo: String?
    let address: String?

    init(apiModel: RestaurantSearchAPIModel) {
        uuid = apiModel.uuid
        name = apiModel.name
        logo = apiModel.logo
        address = apiModel.address
    }
}
