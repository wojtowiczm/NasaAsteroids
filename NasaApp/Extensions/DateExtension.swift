//
//  DateExtension.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

enum DateFormat: String {
    case api = "YYY-MM-dd"
}

extension Date {
    
    func with(format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
    
    static func dateApiKeys(from startDate: Date, to endDate: Date) -> [String] {
        
        var days: [Date] = []
        
        while days.last ?? startDate < endDate {
            if let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: days.last ?? startDate) {
                days.append(nextDay)
            }
        }
        return days.compactMap { $0.with(format: .api) }
    }
    
    
}
