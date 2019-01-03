//
//  NearEarthObjects.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation


struct NearEarthObjects: Decodable {
    
    let data: [AsteroidDayData]
    
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var asteroidDayData: [AsteroidDayData] = []
        container.allKeys.forEach {
            guard let key = NearEarthObjects.CodingKeys(stringValue: $0.stringValue) else { return }
            do {
                let asteroids = try container.decode([Asteroid].self, forKey: key)
                asteroidDayData.append(AsteroidDayData(dayString: $0.stringValue, objects: asteroids))
            } catch {
                print(error.localizedDescription)
            }
        }
        data = asteroidDayData
    }
}
