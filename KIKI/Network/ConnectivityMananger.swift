//
//  ConnectivityMananger.swift
//  KIKI
//
//  Created by Fares Ajimi on 17/11/2021.
//

import Alamofire
import Combine

class ConnectivityMananger: NSObject {

    private override init() {
        super.init()
        setupReachability()
    }
    @Published private (set) var isConnected: Bool = true
    private static let _shared = ConnectivityMananger()

    class func shared() -> ConnectivityMananger {
        return _shared
    }

    private let reachability: NetworkReachabilityManager? = NetworkReachabilityManager()

    var isNetworkAvailable: Bool {
        return reachability?.isReachable ?? false
    }

    private func setupReachability() {
        reachability?.startListening(onQueue: .main, onUpdatePerforming: { [weak self] (status) in
            self?.updateWith(status: status)
        })
    }

    func startListening() {
        reachability?.startListening(onUpdatePerforming: { [weak self] (status) in
            self?.updateWith(status: status)
        })
    }
    func stopListening() {
        reachability?.stopListening()
    }

    private func updateWith(status: NetworkReachabilityManager.NetworkReachabilityStatus) {
        switch status {
        case .unknown, .notReachable:
            self.isConnected = false
        case .reachable(.ethernetOrWiFi), .reachable(.cellular):
            self.isConnected = true
        }
    }
}
