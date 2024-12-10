//
//  DeliveryRestaurantListInteractor.swift
//  KIKI
//
//  Created by Fares Ajimi on 12/11/2021.
//

import Foundation
import Combine
import Moya
import RealmSwift

protocol DeliveryRestaurantListInteractorProtocol: AnyObject {
    func fetchDeliveryRestaurant(offset: Int)
    func fetchDeliveryRestaurant(keyWord: String)
    func fetchCollectionCardList()
}

class DeliveryRestaurantListInteractor: DeliveryRestaurantListInteractorProtocol {

    // MARK: - Properties

    private let presenter: DeliveryRestaurantListPresenterProtocol
    private var cancellableSet = Set<AnyCancellable>()
    private let persistenceManager: PersistenceManagerProtocol
    private let placesService: PlacesServiceProtocol

    // MARK: - DI

    init(
        presenter: DeliveryRestaurantListPresenterProtocol,
        placesService: PlacesServiceProtocol,
        persistenceManager: PersistenceManagerProtocol) {
            self.presenter = presenter
            self.placesService = placesService
            self.persistenceManager = persistenceManager
    }

    // MARK: - Actions

    func fetchCollectionCardList() {
        placesService.fetchCollectionRestaurant(orderSection: true)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    debugPrint(error)
                case .finished:
                    debugPrint("restaurant collections list fetched from database")
                }
            }, receiveValue: { [weak self] collectionCard in
                self?.presenter.present(restaurantCollectionsList: collectionCard)
            })
            .store(in: &self.cancellableSet)
    }

    func fetchDeliveryRestaurant(offset: Int) {
        placesService.fetchDeliveryRestauranList(limit: 10, offset: offset)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    debugPrint(error)
                    self?.fetchCashedRestaurantList()
                case .finished:
                    debugPrint("restaurant list fetched from database")
                }
            }, receiveValue: { [weak self] restaurants in
                self?.presenter.present(restaurantsList: restaurants)
                self?.persistenceManager.saveObjects(restaurants)
            })
            .store(in: &self.cancellableSet)
    }

    func fetchCashedRestaurantList() {
        if let cachedRestaurants = persistenceManager.fetchObjects(
            DeliveryRestaurantRealmObject.self,
            resultType: DeliveryRestaurantCardAPIModel.self), cachedRestaurants.count > 0 {
            presenter.present(restaurantsList: cachedRestaurants)
        }
    }

    func fetchDeliveryRestaurant(keyWord: String) {
        placesService.fetchDeliveryRestaurant(keyWord: keyWord)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    debugPrint(error)
                case .finished:
                    debugPrint("restaurant search list fetched from database")
                }
            }, receiveValue: { [weak self] restaurants in
                self?.presenter.present(restaurantsSearchList: restaurants)
            })
            .store(in: &self.cancellableSet)
    }
}
