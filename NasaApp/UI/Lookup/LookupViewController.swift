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
    
    var isExplanationBackgroundShowed = false
    
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
        bindView()
        viewBuilder.build()
        viewModel.fetchAsteroidDetails()
        viewModel.fetchPictureOfTheDay()
    }
    
    private func bindView() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(explanationContainerTapped))
        viewBuilder.backgroundImageInfoContainer.addGestureRecognizer(recognizer)
    }

    private func bindViewModel() {
        viewModel.asteroidDetailsUpdated = { [weak self] asteroidDetails in
            self?.updateView(with: asteroidDetails)
        }
        
        viewModel.pictureOfTheDayUpdated = { [weak self] pictureData in
            self?.updatePictureOfTheDay(with: pictureData)
        }
        
        viewModel.backgroundImageUpdated = { [weak self] image in
            self?.viewBuilder.backgroundImageView.image = image
        }
    }
    
    private func updateView(with asteroidDetails: AsteroidDetails) {
        title = asteroidDetails.name
        viewBuilder.orbitalPeroidLabel.text = "Orbital Period \(asteroidDetails.orbitalData.orbitalPeriod)"
        viewBuilder.apheliumDistanceLabel.text = "Aphelion Distace \(asteroidDetails.orbitalData.aphelionDistance)"
        viewBuilder.periheliumDistanceLabel.text = "Perihelion Distance \(asteroidDetails.orbitalData.perihelionDistance)"
    }
    
    private func updatePictureOfTheDay(with model: PictureOfTheDay) {
        viewBuilder.backgroundImageTitleLabel.text = model.title
        viewBuilder.backgroundImageExplanationLabel.text = model.explanation
    }
    
    @objc func explanationContainerTapped() {
        isExplanationBackgroundShowed = !isExplanationBackgroundShowed
        viewBuilder.backgroundImageExplanationHeightConstraint.isActive = isExplanationBackgroundShowed
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}
