//
//  PlacesMoyaService.swift
//  KIKI
//
//  Created by Fares Ajimi on 3/1/2022.
//

import Foundation
import Moya

enum PlacesMoyaService {
    case fetchDeliveryRestauranList(limit: Int, offset: Int)
    case fetchDeliveryRestaurant(uuid: String)
    case searchDeliveryRestaurant(keyWord: String)
    case fetchCollectionRestaurant(orderSection: Bool)
}

extension PlacesMoyaService: TargetType {

    var baseURL: URL {
        return URL(string: EndPoint.Url.placesUrl.path)!
    }

    var path: String {
        switch self {
        case .fetchDeliveryRestauranList:
            return "/places/ordering_places_list"
        case .fetchDeliveryRestaurant(let uuid):
            return "/places\(uuid)"
        case .searchDeliveryRestaurant:
            return "/places/search"
        case .fetchCollectionRestaurant:
            return "/collections/search"

        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchDeliveryRestauranList:
            return .post
        case .fetchDeliveryRestaurant:
            return .get
        case .searchDeliveryRestaurant:
            return .post
        case .fetchCollectionRestaurant:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .fetchDeliveryRestauranList(let limit, let offset):
            let bodyParameters: [String: Any] = [
                "latitude": 36.8419,
                "longitude": 10.17427
            ]
            let urlParameters: [String: Any] = [
                "limit": limit,
                "offset": offset
            ]
            return .requestCompositeParameters(
                bodyParameters: bodyParameters,
                bodyEncoding: JSONEncoding.default,
                urlParameters: urlParameters)

        case .searchDeliveryRestaurant(let keyWord):
            let bodyParameters: [String: Any] = [
                "order_filter": true,
                "filter_by": keyWord,
                "longitude": 10.17427,
                "latitude": 36.8419
            ]
            let urlParameters: [String: Any] = [
                "limit": 10,
                "offset": 0
            ]
            return .requestCompositeParameters(
                bodyParameters: bodyParameters,
                bodyEncoding: JSONEncoding.default,
                urlParameters: urlParameters)

        case .fetchCollectionRestaurant(let orderSection):
            let bodyParameters: [String: Any] = [
                "collections_type": "home page",
                "is_order_collection": orderSection,
                "longitude": 10.17427,
                "latitude": 36.8419
            ]
            let urlParameters: [String: Any] = [
                "limit": 10,
                "offset": 0
            ]
            return .requestCompositeParameters(
                bodyParameters: bodyParameters,
                bodyEncoding: JSONEncoding.default,
                urlParameters: urlParameters)

        default:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        // swiftlint:disable line_length
        let mockToken =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1dWlkIjoiYzFiODA0YWMtM2FlNC0xMWViLWFjNGItN2U2OWUzOGNiOWEzIiwiZmlyc3RfbmFtZSI6IkxlbmEgZ2dndXZqZmpjamNrdmljaWR1Y2lmaWRpeGljaWNqY2pjaGNqY2pjanhqIiwibGFzdF9uYW1lIjoiTGVuYTEiLCJlbnRpdHkiOiJ1c2VyIiwiYXVkIjoiRGVza3RvcCIsInBlcm1pc3Npb25zIjpudWxsLCJleHAiOjE2MzczMjg4MTB9.9McNLmV-8YoXGqEHGaIz6EVxTcZaCNVcSC1Y7srfujg"
        let headers = [
            "Authorization": "Bearer \(mockToken)",
            "Content-Type": "application/X-Access-Token"
        ]
        return headers
    }
}
