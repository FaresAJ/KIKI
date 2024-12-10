//
//  SpecialOffer.swift
//  KIKI
//
//  Created by Fares Ajimi on 21/12/2021.
//

import Foundation

struct SpecialOfferAPIModel: Codable {

    let description: String?
    let kind: SpecialOfferType?
    let expirationIn: Int?

    private enum CodingKeys: String, CodingKey {
        case description = "short_label"
        case kind
        case expirationIn = "expiration_in"
    }
}

enum SpecialOfferType: String, Codable {
    case percentage
    case fixed
}
