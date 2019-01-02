//
//  ViewModel.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

class FeedViewModel {
    
    let repository = FeedRepository()
    
    var dataChanged: ((NearEarthObjects) -> Void)?
    
    func fetchAsteroids(from startDate: Date, to endDate: Date) {
        repository.loadData(from: startDate, to: endDate) { [weak self] response in
            self!.dataChanged?(response.nearEarthObjects)
        }
    }
}
