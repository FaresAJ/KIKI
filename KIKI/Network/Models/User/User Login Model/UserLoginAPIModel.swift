//
//  UserLoginAPIModel.swift
//  KIKI
//
//  Created by ons  on 28/12/2021.
//

import Foundation

struct UserLoginAPIModel: Codable {

    let token: String?
    let orderingStatus: String?
    let exception: String?
    let value: String?

    private enum CodingKeys: String, CodingKey {
        case token, value, exception
        case orderingStatus = "ordering_status"
    }
}
