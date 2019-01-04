//
//  CloseApproachData.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

struct CloseAproachData: Codable {
    
    let relativeVelocity: RelativeVelocity
    let missDistance: MissDistance
    
    enum CodingKeys: String, CodingKey {
        case relativeVelocity = "relative_velocity"
        case missDistance = "miss_distance"
    }
}
