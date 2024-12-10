//
//  DeliveryRestaurantCardAPIModel.swift
//  KIKI
//
//  Created by Fares Ajimi on 12/11/2021.
//

import Foundation

struct DeliveryRestaurantCardAPIModel: Codable, Persistable {

    typealias ManagedObject = DeliveryRestaurantRealmObject

    let uuid: String?
    let name: String?
    let logoPath: String?
    let specialties: [String]?
    let distance: String?
    let minimumOrderPrice: Int?
    let reviewsCount: Int?
    var isFavorite: Bool = false
    let deliveryTimeEstimation: Int?
    var isOpen: Bool = true
    let rating: Double?
    let specialOffer: SpecialOfferAPIModel?

    enum CodingKeys: String, CodingKey {
        case uuid, name
        case logoPath = "profile_picture"
        case specialties, distance
        case minimumOrderPrice = "minimum_order_price"
        case reviewsCount = "reviews_count"
        case isFavorite = "is_favorite"
        case deliveryTimeEstimation = "delivery_time_estimation"
        case isOpen = "is_open"
        case rating
        case specialOffer = "special_offer"
    }

    init(managedObject: DeliveryRestaurantRealmObject) {
        uuid = managedObject.uuid
        name = managedObject.name
        logoPath = managedObject.logoPath
        specialties = Array(managedObject.specialties)
        distance = managedObject.distance
        minimumOrderPrice = managedObject.minimumOrderPrice.value
        reviewsCount = managedObject.reviewsCount.value
        isFavorite = managedObject.isFavorite
        deliveryTimeEstimation = managedObject.deliveryTimeEstimation.value
        isOpen = managedObject.isOpen
        rating = managedObject.rating.value
        specialOffer = nil
    }

    func managedObject() -> DeliveryRestaurantRealmObject {
        let realmObject = DeliveryRestaurantRealmObject()
        realmObject.uuid = uuid
        realmObject.name = name
        realmObject.logoPath = logoPath
        if let specialties = specialties {
            realmObject.specialties.append(objectsIn: specialties)
        }
        realmObject.distance = distance
        realmObject.minimumOrderPrice.value = minimumOrderPrice
        realmObject.reviewsCount.value = reviewsCount
        realmObject.isFavorite = isFavorite
        realmObject.deliveryTimeEstimation.value = deliveryTimeEstimation
        realmObject.isOpen = isOpen
        realmObject.rating.value = rating
        return realmObject
    }
}
