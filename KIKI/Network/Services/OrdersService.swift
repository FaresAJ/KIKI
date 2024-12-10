//
//  OrdersService.swift
//  KIKI
//
//  Created by ons  on 3/1/2022.
//

import Alamofire
import Combine

protocol OrdersServiceProtocol: AnyObject {
    func fetchOrdersList(limit: Int, offset: Int) -> Future<[OrderAPIModel], Error>
}

class OrdersService: OrdersServiceProtocol {

    private let baseUrl = EndPoint.Url.orderUrl.path

    // swiftlint:disable line_length
    let mockToken =
    ""

    // MARK: - Fetch Orders

    func fetchOrdersList(limit: Int, offset: Int) -> Future<[OrderAPIModel], Error> {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(mockToken)",
            "Content-Type": "application/X-Access-Token"
        ]
        let url = "\(baseUrl)/orders/search?offset=\(offset)&limit=\(limit)"
        return CoreService.request(url: url, method: .post, parameters: nil, headers: headers)
    }
}
