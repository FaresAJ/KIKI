//
//  OfflineBannerView.swift
//  KIKI
//
//  Created by Fares Ajimi on 17/11/2021.
//

import UIKit
import SwiftUI

class OfflineBannerView: UIView {

    // MARK: Outlets

    @IBOutlet weak var messageLabel: UILabel!

    // MARK: UI

    func setUpView(connected: Bool) {
        if connected {
            let connectedMessage = NSLocalizedString("connectionRestored", comment: "")
            messageLabel.text = connectedMessage
            backgroundColor = UIColor(named: "topaz - Three")
            isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak self] in
                self?.isHidden = true
            })
        } else {
            let disconnectedMessage = NSLocalizedString("connectionInterrupted", comment: "")
            messageLabel.text = disconnectedMessage
            backgroundColor = UIColor(named: "darkIndigo - Two")
            isHidden = false
        }
    }
}
