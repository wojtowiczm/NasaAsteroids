//
//  PictureOfTheDay.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 04/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

struct PictureOfTheDay: Decodable {
    
    let date: String
    let title: String
    let explanation: String
    let url: String
}
