//
//  AsteroidDayData.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation
import CoreData
import SwiftyCoreData

public struct AsteroidDayData: Codable {
    
    let dayString: String
    var objects: [Asteroid]
    
    var dayDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.api.rawValue
        return formatter.date(from: dayString)
    }
    
    init(dayString: String, objects: [Asteroid]) {
        self.dayString = dayString
        self.objects = objects
    }
}

extension AsteroidDayData: SCDManagedObjectConvertible {
    
    public func put(in context: NSManagedObjectContext) {
        let managedObject = AsteroidDayDataMO(context: context)
        managedObject.date = dayString
        if let data = try? JSONEncoder().encode(objects) {
             managedObject.objects = data as NSData?
        }
    }
}
