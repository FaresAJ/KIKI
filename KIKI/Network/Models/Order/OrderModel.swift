//
//  OrderModel.swift
//  KIKI
//
//  Created by ons  on 3/1/2022.
//

import Foundation

struct OrderModel {
    let uuid: String?
    let code: String?
    let clientUuid: String?
    let placeUuid: String?
    let kind: String?
    let place: DeliveryRestaurantDetailsModel?
    var itemsByQuantity: [ItemModel] = []

    init(apiModel: OrderAPIModel) {
        uuid = apiModel.uuid
        code = apiModel.code
        clientUuid = apiModel.clientUuid
        placeUuid = apiModel.placeUuid
        kind = apiModel.kind
        if let restaurant = apiModel.place {
            self.place = DeliveryRestaurantDetailsModel(apiModel: restaurant)
        } else {
            self.place = nil
        }
        if let items = apiModel.itemsByQuantity {
            for item in items {
                self.itemsByQuantity.append(ItemModel(apiModel: item))
            }
        }
    }
}
