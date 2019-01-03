//
//  EstimatedDiameter.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

struct EstimatedDiameter: Decodable {
    let max: Double
    let min: Double
    
    enum CodingKeys: String, CodingKey {
        case max = "estimated_diameter_max"
        case min = "estimated_diameter_min"
    }
}
