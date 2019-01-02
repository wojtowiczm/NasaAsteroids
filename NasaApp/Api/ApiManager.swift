//
//  ApiManager.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation
import Alamofire

enum Endpoint {
    case neoFeed(startDate: Date, endDate: Date)
    
    var method: HTTPMethod {
        switch self {
        case .neoFeed: return .get
        }
    }
    
    var url: String {
        switch self {
            case let .neoFeed(startDate, endDate): return ApiManager.apiUrl + "neo/rest/v1/feed?start_date\(startDate.with(format: .api))&end_date=\(endDate.with(format: .api))"
        }
    }
    var needApiKey: Bool {
        return true
    }
}

class ApiManager {
    
    var apiKey: String {
        return "Wy3LBCRGqtd2M26qgGFQflTaHSxK7aQanAS6CcmY"
    }
    
    static let apiUrl = "https://api.nasa.gov/"
    
    func request(for endpoint: Endpoint, parameters: Parameters) -> DataRequest {
//        Alamofire.request(endpoint.url, method: endpoint.method, parameters: nil, encoding: JSONEncoding.default, headers: headers as? [String: String]).response {
//            respon in
//        }
        let url = endpoint.needApiKey ? "\(endpoint.url)&api_key=\(apiKey)" : endpoint.url
        return Alamofire.request(url, method: endpoint.method, parameters: nil, encoding: JSONEncoding.default, headers: nil)
    }
}

