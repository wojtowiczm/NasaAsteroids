//
//  AsteroidDetails.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

struct AsteroidDetails: Decodable {
    
    let name: String
    let orbitalData: OrbitalData
    
    enum CodingKeys: String, CodingKey {
        case name
        case orbitalData = "orbital_data"
    }
}
