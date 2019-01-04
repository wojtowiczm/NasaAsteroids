//
//  AsteroidDetails.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

public struct AsteroidDetails: Codable {
    
    let id: String
    let name: String
    let orbitalData: OrbitalData
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case orbitalData = "orbital_data"
    }
}
