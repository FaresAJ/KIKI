//
//  DeliveryRestaurantDetailsInteractor.swift
//  KIKI
//
//  Created by Fares Ajimi on 6/12/2021.
//

import Foundation
import Combine
import Alamofire

protocol DeliveryRestaurantDetailsInteractorProtocol: AnyObject {
    func fetchRestaurantDetails()
    func set(uuid: String)
}

class DeliveryRestaurantDetailsInteractor: DeliveryRestaurantDetailsInteractorProtocol {

    // MARK: - Properties

    private let presenter: DeliveryRestaurantDetailsPresenterProtocol
    private var cancellableSet = Set<AnyCancellable>()
    private var uuid: String?
    private let placesService: PlacesServiceProtocol

    // MARK: - DI

    init(
        presenter: DeliveryRestaurantDetailsPresenterProtocol,
        placesService: PlacesServiceProtocol) {
            self.presenter = presenter
            self.placesService = placesService
    }

    func set(uuid: String) {
        self.uuid = uuid
    }

    // MARK: - Actions

    func fetchRestaurantDetails() {
        guard let uuid = uuid else { return }
        placesService.fetchDeliveryRestaurant(uuid: uuid)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                case .finished:
                    debugPrint("restaurant details fetched from database")
                }
            }, receiveValue: { [weak self] restaurantList in
                guard let restaurant = restaurantList.first else { return }
                self?.presenter.presentRestaurantDetails(restaurant: restaurant)
            }).store(in: &self.cancellableSet)
    }
}
