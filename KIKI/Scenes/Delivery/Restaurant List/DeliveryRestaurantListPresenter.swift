//
//  DeliveryRestaurantListPresenter.swift
//  KIKI
//
//  Created by Fares Ajimi on 12/11/2021.
//

import Foundation

protocol DeliveryRestaurantListPresenterProtocol: AnyObject {
    var view: DeliveryRestaurantListViewControllerProtocol? { get set }
    func present(restaurantCollectionsList: [RestaurantCollectionAPIModel])
    func present(restaurantsList: [DeliveryRestaurantCardAPIModel])
    func present(restaurantsSearchList: [RestaurantSearchAPIModel])
}

class DeliveryRestaurantListPresenter: DeliveryRestaurantListPresenterProtocol {

    // MARK: - Properties

    weak var view: DeliveryRestaurantListViewControllerProtocol?
    private let timeFormatter: TimeFormatterProtocol

    // MARK: - DI

    init(timeFormatter: TimeFormatterProtocol) {
        self.timeFormatter = timeFormatter
    }

    // MARK: - Actions

    func present(restaurantCollectionsList: [RestaurantCollectionAPIModel]) {
        let restaurantCollectionPresentableList = restaurantCollectionsList
            .map({ restaurantCollection -> RestaurantCollectionModel in
            return RestaurantCollectionModel(apiModel: restaurantCollection)
        })
        view?.display(restaurantCollections: restaurantCollectionPresentableList)
    }

    func present(restaurantsList: [DeliveryRestaurantCardAPIModel]) {
        let deliveryRestaurantPresentableList = restaurantsList
            .map({ restaurant -> DeliveryRestaurantCardModel in
                if let expirationIn = restaurant.specialOffer?.expirationIn {
                    let expirationTime = timeFormatter.formatTimeToExpire(miliseconds: expirationIn)
                    return DeliveryRestaurantCardModel(apiModel: restaurant, expirationTime: expirationTime)
                } else {
                    return DeliveryRestaurantCardModel(apiModel: restaurant)
                }
            })
        view?.display(restaurants: deliveryRestaurantPresentableList)
    }

    func present(restaurantsSearchList: [RestaurantSearchAPIModel]) {
        let restaurantSearchPresentableList = restaurantsSearchList
            .map({ restaurant -> RestaurantSearchModel in
            return RestaurantSearchModel(apiModel: restaurant)
        })
        view?.display(restaurantsSearchList: restaurantSearchPresentableList)
    }
}
