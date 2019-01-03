//
//  FeedRepository.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

class FeedRepository {
    
    let asteroidsService: FeedService = ApiManager()
   
    func loadData(from startDate: Date, to endDate: Date, success: @escaping (NeoFeedResponse) -> Void) {
        asteroidsService.fetchNeoFeed(startDate: startDate, endDate: endDate, success: success)
    }
}
