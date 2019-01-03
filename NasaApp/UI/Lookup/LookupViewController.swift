//
//  LookupViewController.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import UIKit

class LookupViewController: UIViewController {
    
    let viewModel: LookupViewModel
    
    lazy var viewBuilder = LookupViewBuilder(with: self.view)
    
    init(with asteroidId: String) {
        viewModel = LookupViewModel(with: asteroidId)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewBuilder.build()
        viewModel.fetchAsteroidDetails()
        viewModel.fetchPictureOfTheDay()
    }
    
    private func setupView() {
        
    }

    private func bindViewModel() {
        viewModel.asteroidDetailsUpdated = { [weak self] asteroidDetails in
            self?.updateView(with: asteroidDetails)
        }
        
        viewModel.pictureOfTheDayUpdated = { [weak self] pictureData in
            self?.updateBackgroundImage(with: pictureData)
        }
    }
    
    private func updateView(with asteroidDetails: AsteroidDetails) {
        title = asteroidDetails.name
        viewBuilder.orbitalPeroidLabel.text = asteroidDetails.orbitalData.orbitalPeriod
        viewBuilder.apheliumDistanceLabel.text = asteroidDetails.orbitalData.aphelionDistance
        viewBuilder.periheliumDistanceLabel.text = asteroidDetails.orbitalData.perihelionDistance
    }
    
    private func updateBackgroundImage(with data: Data) {
        viewBuilder.backgroundImageView.image = UIImage(data: data)
    }
}
