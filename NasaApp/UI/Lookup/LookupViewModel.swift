//
//  LookupViewModel.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import UIKit

class LookupViewModel {
    
    lazy var repository = LookupRepository()
    
    var asteroidId: String
    
    init(with asteroidId: String) {
        self.asteroidId = asteroidId
    }
    
    var asteroidDetailsUpdated: ((AsteroidDetails) -> Void)?
    
    var pictureOfTheDayUpdated: ((PictureOfTheDay) -> Void)?
    
    var backgroundImageUpdated: ((UIImage?) -> Void)?
    
    func fetchAsteroidDetails() {
        repository.fetchAsteroidDetails(with: asteroidId) { [weak self] asteroidDetails in
            self?.asteroidDetailsUpdated?(asteroidDetails)
        }
    }
    
    func fetchPictureOfTheDay() {
        repository.fetchPictureOfTheDay { [weak self] data in
            self?.pictureOfTheDayUpdated?(data)
            self?.fetchBackgroundImage(with: data.url)
        }
    }
    
    func fetchBackgroundImage(with url: String) {
        repository.fetchBackgroundImageData(with: url) { [weak self] imageData in
            self?.backgroundImageUpdated?(UIImage(data: imageData))
        }
    }
    
}
