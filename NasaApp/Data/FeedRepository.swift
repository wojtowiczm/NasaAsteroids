//
//  FeedRepository.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation
import SwiftyCoreData

class FeedRepository {
    
    let asteroidsService: FeedService = ApiManager()
    
    let asteroidStorageController = SCDWorker<AsteroidDayData, AsteroidDayDataMO>(persistanceService: PersistanceService.shared)
    
    func realodCache(from startDate: Date, to endDate: Date, completion: @escaping (Bool) -> Void) {
        asteroidsService.fetchNeoFeed(
            startDate: startDate,
            endDate: endDate,
            success: { [weak self] response in
                self?.asteroidStorageController.deleteAll()
                self?.asteroidStorageController.save(objects: response.nearEarthObjects.data)
                completion(true)
                },
            failure: { _ in completion(false) })
    }

    func loadCachedData(success: @escaping ([AsteroidDayData]) -> Void) {
        asteroidStorageController.fetchAll { data in
            success(data ?? [])
        }
    }
}
