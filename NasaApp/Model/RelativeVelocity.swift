//
//  RelativeVelocity.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

struct RelativeVelocity: Codable {
    let kilometersPerHour: String
    
    enum CodingKeys: String, CodingKey {
        case kilometersPerHour = "kilometers_per_hour"
    }
}
