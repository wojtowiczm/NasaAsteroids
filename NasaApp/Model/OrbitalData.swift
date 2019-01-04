//
//  File.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

struct OrbitalData: Codable {
    
    let perihelionDistance: String
    let aphelionDistance: String
    let orbitalPeriod: String
    
    enum CodingKeys: String, CodingKey {
        case perihelionDistance = "perihelion_distance"
        case aphelionDistance = "aphelion_distance"
        case orbitalPeriod = "orbital_period"
    }
}
