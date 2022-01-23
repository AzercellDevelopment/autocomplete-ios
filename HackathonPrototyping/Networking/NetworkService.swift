//
//  NetworkAlamofire.swift
//  NetworingWithAlamofire
//
//  Created by Aysel Heydarova on 22.01.22.
//

import Foundation
import Alamofire
import PromiseKit

public typealias Cancellation = () -> Void
public typealias APIResponse<T: Decodable> = (promise: Promise<T>, cancellation: Cancellation)

public protocol NetworkServiceProtocol: AnyObject {
    func execute<T: Codable>(_ endpoint: EndPointType, completion: @escaping (Swift.Result<T, AFError>) -> Void)
    func execute<T: Codable>(_ endpoint: EndPointType, model: T) ->  Promise<T>
}

public class NetworkService: NetworkServiceProtocol {
    public func execute<T: Codable>(_ endpoint: EndPointType, completion: @escaping (Swift.Result<T, AFError>) -> Void) {
        let request = AF.request(endpoint.urlRequest)

        request.responseDecodable(of: T.self) { result in
            if let value = result.value {
                completion(.success(value))
            } else if let error = result.error {
                completion(.failure(error))
            }
        }
    }

   public func execute<T: Decodable>(_ endpoint: EndPointType, model: T) -> Promise<T> {
        var request: DataRequest?

        let promise = Promise<T> { seal in
            request = AF.request(endpoint.urlRequest)
            request?.responseDecodable(of: T.self) { result in
                if let data = result.value {
                    seal.fulfill(data)
                } else if let error = result.error {
                    seal.reject(error)
                }
            }
        }

        let cancellation = {
            request?.cancel()
            request = nil
        }
        return promise
    }
}
