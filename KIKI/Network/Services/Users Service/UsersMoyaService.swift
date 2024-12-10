//
//  UsersMoyaService.swift
//  KIKI
//
//  Created by Fares Ajimi on 7/1/2022.
//

import Foundation
import Moya

enum UsersMoyaService {
    case loginUser(email: String, password: String)
}

extension UsersMoyaService: TargetType {

    var baseURL: URL {
        return URL(string: EndPoint.Url.defaultUrl.path)!
    }

    var path: String {
        switch self {
        case .loginUser:
            return "/users/login"
        }
    }

    var method: Moya.Method {
        switch self {
        case .loginUser:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .loginUser(let email, let password):
            let bodyParameters: [String: Any] = [
                "email": email,
                "password": password
            ]
            return .requestParameters(parameters: bodyParameters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String: String]? {
        let headers = [
            "Content-Type": "application/X-Access-Token"
        ]
        return headers
    }
}
