//
//  Asteroid+CoreDataProperties.swift
//  
//
//  Created by Michał Wójtowicz on 02/01/2019.
//
//

import Foundation
import CoreData


extension Asteroid {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Asteroid> {
        return NSFetchRequest<Asteroid>(entityName: "Asteroid")
    }

    @NSManaged public var name: String?
    @NSManaged public var diameter: Double
    @NSManaged public var isHazardous: Bool
    @NSManaged public var speed: Double
    @NSManaged public var distanceFromEarth: Double

}
