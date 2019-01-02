//
//  NeoFeedResponse.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

struct NeoFeedResponse: Decodable {
    
    let nearEarthObjects: NearEarthObjects

    enum CodingKeys: String, CodingKey {
        case nearEarthObjects = "near_earth_objects"
    }
}

class NearEarthObjects: Decodable {
    
    var data: [AsteroidDayData]
    
    struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        init?(intValue: Int) {
            return nil
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = []
        container.allKeys.forEach {
            guard let key = NearEarthObjects.CodingKeys(stringValue: $0.stringValue) else { return }
            do {
                let asteroids = try container.decode([Asteroid].self, forKey: key)
                self.data.append(AsteroidDayData(dayDate: $0.stringValue, objects: asteroids))
            } catch {
                print(error.localizedDescription)
            }
          //  let asteroids = try? container.decode([Asteroid].self, forKey: key)
            
        }
    }
}

struct AsteroidDayData: Decodable {
    
    let dayDate: String
    var objects: [Asteroid]
}

struct Asteroid: Decodable {
    
   // let id: Int
    let name: String
//    let estimatedDiameter: EstimatedDiameterByUnit
//    let isPotentiallyHazardous: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
////        case estimatedDiameter = "estimated_diameter"
////        case isPotentiallyHazardous = "is_potentially_hazardous_asteroid"
//    }
    
}

struct EstimatedDiameterByUnit: Decodable {
    let kilometers: EstimatedDiameter
    let meters: EstimatedDiameter
    let miles: EstimatedDiameter
    let feet: EstimatedDiameter
}

struct EstimatedDiameter: Decodable {
    let max: Double
    let min: Double
    
    enum CodingKeys: String, CodingKey {
        case max = "esyiimated_diameter_max"
        case min = "estimated_Diameter_min"
    }
}


