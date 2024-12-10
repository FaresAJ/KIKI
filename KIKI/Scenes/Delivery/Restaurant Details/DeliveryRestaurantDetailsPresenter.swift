//
//  DeliveryRestaurantDetailsPresenter.swift
//  KIKI
//
//  Created by Fares Ajimi on 6/12/2021.
//

import Foundation

protocol DeliveryRestaurantDetailsPresenterProtocol: AnyObject {
    var view: DeliveryRestaurantDetailsViewControllerProtocol? { get set }
    func presentRestaurantDetails(restaurant: DeliveryRestaurantDetailsAPIModel)
}

class DeliveryRestaurantDetailsPresenter: DeliveryRestaurantDetailsPresenterProtocol {

    // MARK: - Properties

    weak var view: DeliveryRestaurantDetailsViewControllerProtocol?

    // MARK: - Actions

    func presentRestaurantDetails(restaurant: DeliveryRestaurantDetailsAPIModel) {
        let deliveryRestaurantPresentableDetails = DeliveryRestaurantDetailsModel(apiModel: restaurant)
        view?.display(restaurant: deliveryRestaurantPresentableDetails)
    }
}
