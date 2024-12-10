//
//  LocationAPIModel.swift
//  KIKI
//
//  Created by Fares Ajimi on 31/12/2021.
//

import Foundation

struct LocationAPIModel: Codable {

    var id: String?
    var address: String?
    var label: String?
    var indication: String?
    var coordinates: CoordinatesAPIModel?

    private enum CodingKeys: String, CodingKey {
        case id = "uuid", address, label, indication, coordinates
    }
}
