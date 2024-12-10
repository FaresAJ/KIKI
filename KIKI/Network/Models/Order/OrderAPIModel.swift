//
//  OrderAPIModel.swift
//  KIKI
//
//  Created by ons  on 3/1/2022.
//

import Foundation

struct OrderAPIModel: Codable {
    let uuid: String?
    let code: String?
    let clientUuid: String?
    let placeUuid: String?
    let kind: String?
    let place: DeliveryRestaurantDetailsAPIModel?
    let itemsByQuantity: [ItemAPIModel]?

    enum CodingKeys: String, CodingKey {
        case uuid, code, kind, place
        case clientUuid = "client_uuid"
        case placeUuid = "place_uuid"
        case itemsByQuantity = "items_by_quantity"
    }
}
