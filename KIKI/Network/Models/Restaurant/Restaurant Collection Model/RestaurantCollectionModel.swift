//
//  RestaurantCollectionModel.swift
//  KIKI
//
//  Created by Fares Ajimi on 13/12/2021.
//

import Foundation

struct RestaurantCollectionModel: Codable {

    var uuid: String?
    var label: String?
    var image: String?

    init(apiModel: RestaurantCollectionAPIModel) {
        uuid = apiModel.uuid
        label = apiModel.label
        image = apiModel.image
    }
}
