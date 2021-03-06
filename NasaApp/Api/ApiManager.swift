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
    case lookup(asteroidId: String)
    case pictureOfTheDay
    case image(url: String)
    
    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var url: String {
        switch self {
        case let .neoFeed(startDate, endDate): return ApiManager.apiUrl + "neo/rest/v1/feed?start_date=\(startDate.with(format: .api))&end_date=\(endDate.with(format: .api))"
        case let .lookup(asteroidId): return ApiManager.apiUrl + "neo/rest/v1/neo/" + asteroidId
        case let .image(url): return url
        case .pictureOfTheDay: return ApiManager.apiUrl + "planetary/apod"
        }
    }
    
    var needApiKey: Bool {
        switch self {
        case .image: return false
        default: return true
        }
    }
}

class ApiManager {
    
    var apiKey: String {
        return "Wy3LBCRGqtd2M26qgGFQflTaHSxK7aQanAS6CcmY"
    }
    
    static let apiUrl = "https://api.nasa.gov/"
    
    func request(for endpoint: Endpoint, parameters: Parameters? = nil) -> DataRequest {
        let apiKeyPrefix = endpoint.url.contains("?") ? "&" : "?"
        let url = endpoint.needApiKey ? "\(endpoint.url)\(apiKeyPrefix)api_key=\(apiKey)" : endpoint.url
        return Alamofire.request(url, method: endpoint.method, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
    }
}

