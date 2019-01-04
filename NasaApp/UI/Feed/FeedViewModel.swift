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
    
    var dataChanged: (([AsteroidDayData]) -> Void)?
    
    var datesUpdated: ((Date,Date) -> Void)?
    
    func reloadData() {
        repository.realodCache(from: startDate, to: endDate) { [weak self] completion in
            guard let dataChanged = self?.dataChanged else { return }
            self?.repository.loadCachedData(success: dataChanged)
        }
    }
    
    func loadFromCache() {
        repository.loadCachedData(success: dataChanged!)
    }

    func validateDates() {
        if startDate > endDate || startDate.addingTimeInterval(TimeInterval.days(30)) < endDate  {
            endDate = Calendar.current.date(byAdding: .day, value: 7, to: startDate)
        }
        datesUpdated?(startDate, endDate)
    }
}
