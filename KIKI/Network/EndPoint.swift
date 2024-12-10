//
//  EndPoints.swift
//  KIKI
//
//  Created by Fares Ajimi on 15/11/2021.
//

import Foundation
import SwiftUI

class EndPoint {
    private let isDev = false
    private let baseUrlDev = ""
    private let baseUrlProd = ""
    private var getBaseUrl: String {
        let baseUrl = isDev ? baseUrlDev : baseUrlProd
        return baseUrl
    }

    private enum Port: String {
        case defaultPort = "32004"
        case placesPort = "32003"
        case orderPort = "32005"
        case orderTrackingPort = "32006"
    }

    enum Url: String {
       case defaultUrl
       case placesUrl
       case orderUrl
       case orderTrackingUrl

       var path: String {
           switch self {
           case .defaultUrl:
               return "\(EndPoint().getBaseUrl):\(Port.defaultPort.rawValue)"
           case .placesUrl:
               return "\(EndPoint().getBaseUrl):\(Port.placesPort.rawValue)"
           case .orderUrl:
               return "\(EndPoint().getBaseUrl):\(Port.orderPort.rawValue)"
           case .orderTrackingUrl:
               return "\(EndPoint().getBaseUrl):\(Port.orderTrackingPort.rawValue)"
           }
       }
    }
}
