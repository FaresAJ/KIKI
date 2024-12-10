//
//  ItemAPIModel.swift
//  KIKI
//
//  Created by ons  on 3/1/2022.
//

import Foundation

struct ItemAPIModel: Codable {
    let itemUuid: String?
    let itemLabel: String?
    let itemPrice: Float?
    let quantity: Int?
    let totalPrice: Float?
    enum CodingKeys: String, CodingKey {
        case quantity
        case itemUuid = "item_uuid"
        case itemLabel = "item_label"
        case itemPrice = "item_price"
        case totalPrice = "total_price"
    }
}
