//
//  Asteroid.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

struct Asteroid: Codable {
    
    let id: String
    let name: String
    let estimatedDiameter: EstimatedDiameterByUnit
    let isPotentiallyHazardous: Bool
    let closeAproachData: [CloseAproachData]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case estimatedDiameter = "estimated_diameter"
        case isPotentiallyHazardous = "is_potentially_hazardous_asteroid"
        case closeAproachData = "close_approach_data"
    }
}
