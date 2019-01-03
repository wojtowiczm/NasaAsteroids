//
//  LookupViewModel.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

class LookupViewModel {
    
    lazy var repository = LookupRepository()
    
    var asteroidId: String
    
    init(with asteroidId: String) {
        self.asteroidId = asteroidId
    }
    
    var asteroidDetailsUpdated: ((AsteroidDetails) -> Void)?
    
    var pictureOfTheDayUpdated: ((_ pictureData: Data) -> Void)?
    
    func fetchAsteroidDetails() {
        repository.fetchAsteroidDetails(with: asteroidId) { [weak self] asteroidDetails in
            self?.asteroidDetailsUpdated?(asteroidDetails)
        }
    }
    
    func fetchPictureOfTheDay() {
        repository.fetchPictureOfTheDay { [weak self] data in
            self?.pictureOfTheDayUpdated?(data)
        }
    }
    
}
