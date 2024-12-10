//
//  PlacesService.swift
//  KIKI
//
//  Created by Fares Ajimi on 15/11/2021.
//

import Alamofire
import Combine
import Moya

protocol PlacesServiceProtocol: AnyObject {
    func fetchDeliveryRestauranList(limit: Int, offset: Int)
    -> AnyPublisher<[DeliveryRestaurantCardAPIModel], MoyaError>
    func fetchDeliveryRestaurant(uuid: String)
    -> AnyPublisher<[DeliveryRestaurantDetailsAPIModel], MoyaError>
    func fetchDeliveryRestaurant(keyWord: String)
    -> AnyPublisher<[RestaurantSearchAPIModel], MoyaError>
    func fetchCollectionRestaurant(orderSection: Bool)
    -> AnyPublisher<[RestaurantCollectionAPIModel], MoyaError>
}

class PlacesService: PlacesServiceProtocol {

    private let provider = MoyaProvider<PlacesMoyaService>(
        plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

    // MARK: Delivery Restaurant

    func fetchDeliveryRestauranList(limit: Int, offset: Int)
    -> AnyPublisher<[DeliveryRestaurantCardAPIModel], MoyaError> {
        return provider.requestPublisher(.fetchDeliveryRestauranList(limit: limit, offset: offset))
            .map([DeliveryRestaurantCardAPIModel].self)
    }

    func fetchDeliveryRestaurant(uuid: String)
    -> AnyPublisher<[DeliveryRestaurantDetailsAPIModel], MoyaError> {
        return provider.requestPublisher(.fetchDeliveryRestaurant(uuid: uuid))
            .map([DeliveryRestaurantDetailsAPIModel].self)
    }

    func fetchDeliveryRestaurant(keyWord: String)
    -> AnyPublisher<[RestaurantSearchAPIModel], MoyaError> {
        return provider.requestPublisher(.searchDeliveryRestaurant(keyWord: keyWord))
            .map([RestaurantSearchAPIModel].self)
    }

    // MARK: Collection Restaurant

    func fetchCollectionRestaurant(orderSection: Bool)
    -> AnyPublisher<[RestaurantCollectionAPIModel], MoyaError> {
        return provider.requestPublisher(.fetchCollectionRestaurant(orderSection: orderSection))
            .map([RestaurantCollectionAPIModel].self)
    }
}
