//
//  AppEndpoints.swift
//  NetworingWithAlamofire
//
//  Created by Aysel Heydarova on 22.01.22.
//

import Foundation
import Alamofire

enum AppEndpoints {
    case home
    case productDetails(id: Int)
}

extension AppEndpoints: EndPointType {
    var path: String {
        switch self {
        case .home:
            return "api/home"
        case .productDetails(let id):
            return "api/product/\(id)"
        }
    }

    var parameters: Parameters? {
        switch self {
        case .home:
            return nil
        case .productDetails:
            return nil
        }
    }

    var method: HTTPMethod {
        switch self {
        case .home:
            return .get
        case .productDetails:
            return .get
        }
    }
}
