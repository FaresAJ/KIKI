//
//  DeliveryRestaurantRealmObject.swift
//  KIKI
//
//  Created by Fares Ajimi on 19/11/2021.
//

import RealmSwift

final class DeliveryRestaurantRealmObject: Object {

    @objc dynamic var uuid: String?
    @objc dynamic var name: String?
    @objc dynamic var logoPath: String?
    let specialties = List<String>()
    @objc dynamic var distance: String?
    let minimumOrderPrice = RealmProperty<Int?>()
    let reviewsCount = RealmProperty<Int?>()
    @objc dynamic var isFavorite: Bool = false
    @objc dynamic var isOpen: Bool = false
    let rating = RealmProperty<Double?>()
    let deliveryTimeEstimation = RealmProperty<Int?>()

    override static func primaryKey() -> String? {
        return "uuid"
    }
}
