//
//  LookupService.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import Foundation

protocol LookupService {
    
    func fetchAsteroidDetails(with id: String, success: @escaping (AsteroidDetails) -> Void)
    func fetchPictureOfTheDay(success: @escaping (PictureOfTheDay) -> Void)
    func fetchBackgroundImageData(from url: String, success: @escaping (Data) -> Void)
}

extension ApiManager: LookupService {
    
    func fetchAsteroidDetails(with id: String, success: @escaping (AsteroidDetails) -> Void) {
        request(for: .lookup(asteroidId: id)).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let asteroidDetails = try JSONDecoder().decode(AsteroidDetails.self, from: data)
                        success(asteroidDetails)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchPictureOfTheDay(success: @escaping (PictureOfTheDay) -> Void) {
        request(for: .pictureOfTheDay).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let pictureOfTheDay = try JSONDecoder().decode(PictureOfTheDay.self, from: data)
                        success(pictureOfTheDay)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchBackgroundImageData(from url: String, success: @escaping (Data) -> Void) {
        request(for: .image(url: url)).responseData { response in
            switch response.result {
            case .success(let data):
                success(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
