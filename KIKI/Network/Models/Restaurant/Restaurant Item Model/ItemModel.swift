//
//  ItemModel.swift
//  KIKI
//
//  Created by ons  on 3/1/2022.
//

import Foundation

struct ItemModel {
    let itemUuid: String?
    let itemLabel: String?
    let itemPrice: Float?
    let quantity: Int?
    let totalPrice: Float?

    init(apiModel: ItemAPIModel) {
        itemUuid = apiModel.itemUuid
        itemLabel = apiModel.itemLabel
        itemPrice = apiModel.itemPrice
        quantity = apiModel.quantity
        totalPrice = apiModel.totalPrice
    }
}
