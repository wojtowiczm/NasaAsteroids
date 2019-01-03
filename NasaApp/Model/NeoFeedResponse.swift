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
