//
//  LookupRepository.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

class LookupRepository {
    
    private let lookupService: LookupService = ApiManager()
    
    func fetchAsteroidDetails(with id: String, success: @escaping (AsteroidDetails) -> Void) {
        lookupService.fetchAsteroidDetails(with: id, success: success)
    }
    
    func fetchPictureOfTheDay(success: @escaping (PictureOfTheDay) -> Void) {
        lookupService.fetchPictureOfTheDay(success: success)
    }
    
    func fetchBackgroundImageData(with url: String, success: @escaping (Data) -> Void) {
        lookupService.fetchBackgroundImageData(from: url, success: success)
    }
    
}
