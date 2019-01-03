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
    
    var startDate: Date! = Date() {
        didSet { validateDates() }
    }
    
    var endDate: Date! = Date(timeIntervalSinceNow: TimeInterval.days(7))  {
        didSet { validateDates()}
    }
    
    var dataChanged: ((NearEarthObjects) -> Void)?
    
    var datesUpdated: ((Date,Date) -> Void)?
    
    func fetchAsteroids() {
        repository.loadData(from: startDate, to: endDate) { [weak self] response in
            self?.dataChanged?(response.nearEarthObjects)
        }
    }

    func validateDates() {
        if startDate > endDate || startDate.addingTimeInterval(TimeInterval.days(30)) < endDate  {
            endDate = Calendar.current.date(byAdding: .day, value: 7, to: startDate)
        }
        datesUpdated?(startDate, endDate)
        fetchAsteroids()
    }
}
