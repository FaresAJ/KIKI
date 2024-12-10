//
//  RestaurantCollectionAPIModel.swift
//  KIKI
//
//  Created by Fares Ajimi on 13/12/2021.
//

import Foundation

struct RestaurantCollectionAPIModel: Codable {

    var uuid: String?
    var label: String?
    var image: String?

    private enum CodingKeys: String, CodingKey {
        case uuid, label, image
    }
}
