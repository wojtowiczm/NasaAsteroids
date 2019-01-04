//
//  AsteroidDayDataMO+CoreDataClass.swift
//  
//
//  Created by Michał Wójtowicz on 04/01/2019.
//
//

import Foundation
import CoreData
import SwiftyCoreData

@objc(AsteroidDayDataMO)
public class AsteroidDayDataMO: NSManagedObject {
    
    private let decoder = JSONDecoder()
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<AsteroidDayDataMO> {
        return NSFetchRequest<AsteroidDayDataMO>(entityName: "AsteroidDayDataMO")
    }
    
    @NSManaged public var date: String?
    @NSManaged public var objects: NSData?
    
}

extension AsteroidDayDataMO: SCDObjectConvertible {
    
    public typealias Object = AsteroidDayData
    
    public func toObject() -> AsteroidDayData? {
        guard let dayString = date,
            let data = objects as Data?,
            let asteroids = try? decoder.decode([Asteroid].self, from: data) else {
            return nil
        }
        return AsteroidDayData(dayString: dayString, objects: asteroids)
    } 
}

