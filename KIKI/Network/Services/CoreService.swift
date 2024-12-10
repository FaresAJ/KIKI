//
//  CoreService.swift
//  KIKI
//
//  Created by Fares Ajimi on 15/11/2021.
//

import Combine
import Alamofire

struct CoreService {

    static func request<T: Decodable, E: Error>(
        url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        decoder: JSONDecoder = JSONDecoder(),
        headers: HTTPHeaders? = nil
    ) -> Future<T, E> {
        return Future({ promise in
            AF.request(
                url,
                method: method,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: headers
                ).responseDecodable(decoder: decoder,
                                completionHandler: { (response: DataResponse<T, AFError>) in
                switch response.result {
                case .success(let value):
                    promise(.success(value))
                case .failure(let error):
                    promise(.failure(
                        (NSError(domain: error.destinationURL?.absoluteString ?? "",
                                 code: error.responseCode ?? 0) as? E)!
                        )
                )
                }
            })
        })
    }
}
