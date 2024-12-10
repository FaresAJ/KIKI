//
//  OrderListInteractor.swift
//  KIKI
//
//  Created by ons  on 31/12/2021.
//

import Foundation
import Combine

protocol OrderListInteractorProtocol: AnyObject {
    func fetchOrders(offset: Int, limit: Int)
    func fetchDeliveryRestaurant(offset: Int)
}

class OrderListInteractor: OrderListInteractorProtocol {

    // MARK: - Properties

    private let presenter: OrderListPresenterProtocol
    private var cancellableSet = Set<AnyCancellable>()
    private let persistenceManager: PersistenceManagerProtocol
    private let ordersService: OrdersServiceProtocol
    private let placesService: PlacesServiceProtocol

    // MARK: - DI

    init(
        presenter: OrderListPresenterProtocol,
        ordersService: OrdersServiceProtocol,
        persistenceManager: PersistenceManagerProtocol,
        placesService: PlacesServiceProtocol) {
            self.presenter = presenter
            self.ordersService = ordersService
            self.persistenceManager = persistenceManager
            self.placesService = placesService
        }

    // MARK: - Actions

    func fetchOrders(offset: Int, limit: Int) {
        ordersService.fetchOrdersList(limit: limit, offset: offset)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    debugPrint(error)
                case .finished:
                    debugPrint("Order list fetched from database")
                }
            }, receiveValue: { [weak self] orders in
                self?.presenter.present(orderList: orders)

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
}
