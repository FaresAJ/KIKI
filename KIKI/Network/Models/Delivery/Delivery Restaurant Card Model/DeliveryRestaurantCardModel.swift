//
//  DeliveryRestaurantModel.swift
//  KIKI
//
//  Created by Fares Ajimi on 30/11/2021.
//

import Foundation

struct DeliveryRestaurantCardModel {

    let uuid: String?
    let name: String?
    let logoPath: String?
    let specialties: String?
    let distance: String?
    let minimumOrderPrice: String?
    let reviewsCount: Int?
    var isFavorite: Bool = false
    let deliveryTimeEstimation: Int?
    let isOpen: Bool?
    let rating: Double?
    let specialOffer: SpecialOfferModel?

    init(apiModel: DeliveryRestaurantCardAPIModel, expirationTime: String? = nil) {
        uuid = apiModel.uuid
        name = apiModel.name
        logoPath = apiModel.logoPath
        specialties = apiModel.specialties?.joined(separator: " • ")
        distance = apiModel.distance
        if let minimumOrderPrice = apiModel.minimumOrderPrice {
            self.minimumOrderPrice = "Min \(minimumOrderPrice) €"
        } else {
            self.minimumOrderPrice = ""
        }
        reviewsCount = apiModel.reviewsCount
        isFavorite = apiModel.isFavorite
        deliveryTimeEstimation = apiModel.deliveryTimeEstimation
        isOpen = apiModel.isOpen
        rating = apiModel.rating
        if let specialOffer = apiModel.specialOffer {
            self.specialOffer = SpecialOfferModel(apiModel: specialOffer, expirationTime: expirationTime)
        } else {
            self.specialOffer = nil
        }
    }
}
