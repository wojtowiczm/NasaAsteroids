//
//  AsteroidDayData.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

struct AsteroidDayData: Decodable {
    
    let dayString: String
    var objects: [Asteroid]
    
    var dayDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.api.rawValue
        return formatter.date(from: dayString)
    }
}
