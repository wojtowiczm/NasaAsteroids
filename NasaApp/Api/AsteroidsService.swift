//
//  AsteroidsService.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

protocol AsteroidsService {
    func fetchNeoFeed(startDate: Date, endDate: Date, success: @escaping (NeoFeedResponse) -> Void)
}

extension ApiManager: AsteroidsService {
    
    func fetchNeoFeed(startDate: Date, endDate: Date, success: @escaping (NeoFeedResponse) -> Void) {
        request(for: .neoFeed(startDate: startDate, endDate: endDate), parameters: [:]).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data, let neoFeedResponse = try? JSONDecoder().decode(NeoFeedResponse.self, from: data) {
                    success(neoFeedResponse)
                }
            case .failure(let error):
                
                return
            }
        }
    }
}
