//
//  SpecialOfferModel.swift
//  KIKI
//
//  Created by Fares Ajimi on 22/12/2021.
//

import Foundation
import UIKit

struct SpecialOfferModel {

    let description: String?
    let offerImageName: String?
    let expirationTime: String?
    let expirationBannerColor: UIColor?

    init(apiModel: SpecialOfferAPIModel, expirationTime: String?) {
        self.description = apiModel.description
        switch apiModel.kind {
        case .percentage:
            offerImageName = "Percentage discount icon"
            expirationBannerColor = UIColor(named: "reddishOrange")
        case .fixed:
            offerImageName = "Fixed discount icon"
            expirationBannerColor = UIColor(named: "rosePink")
        case .none:
            offerImageName = nil
            expirationBannerColor = nil
        }
        self.expirationTime = expirationTime
    }
}
