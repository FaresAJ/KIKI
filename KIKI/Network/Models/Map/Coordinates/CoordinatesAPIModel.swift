//
//  CoordinatesAPIModel.swift
//  KIKI
//
//  Created by Fares Ajimi on 31/12/2021.
//

import Foundation

struct CoordinatesAPIModel: Codable {

    var type: CoordinatesType?
    var coordinates: [Double]?

    private enum CodingKeys: String, CodingKey {
        case type, coordinates
    }
}
