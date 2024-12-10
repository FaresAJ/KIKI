//
//  OrderListPresenter.swift
//  KIKI
//
//  Created by ons  on 31/12/2021.
//

import Foundation

protocol OrderListPresenterProtocol: AnyObject {
    var view: OrderListViewControllerProtocol? { get set }
    func present(orderList: [OrderAPIModel])
    func present(restaurantsList: [DeliveryRestaurantCardAPIModel])
}

class OrderListPresenter: OrderListPresenterProtocol {

    // MARK: - Properties

    var view: OrderListViewControllerProtocol?
    private let timeFormatter: TimeFormatterProtocol

    // MARK: - DI

    init(timeFormatter: TimeFormatterProtocol) {
        self.timeFormatter = timeFormatter
    }

    // MARK: - Actions

    func present(orderList: [OrderAPIModel]) {
        let orderListPresentableList = orderList
            .map({ orderList -> OrderModel in
            return OrderModel(apiModel: orderList)
        })
        view?.display(orderList: orderListPresentableList)
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
}
