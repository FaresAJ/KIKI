//
//  NotificationsMoyaService.swift
//  KIKI
//
//  Created by Fares Ajimi on 7/1/2022.
//

import Foundation
import Moya

enum NotificationsMoyaService {
    case fetchNotificationList(limit: Int, offset: Int)
}

extension NotificationsMoyaService: TargetType {

    var baseURL: URL {
        return URL(string: EndPoint.Url.defaultUrl.path)!
    }

    var path: String {
        switch self {
        case .fetchNotificationList:
            return "/notifications/search"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchNotificationList:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .fetchNotificationList(let limit, let offset):
            let urlParameters: [String: Any] = [
                "limit": limit,
                "offset": offset
            ]
            return .requestParameters(parameters: urlParameters, encoding: URLEncoding.queryString)
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
