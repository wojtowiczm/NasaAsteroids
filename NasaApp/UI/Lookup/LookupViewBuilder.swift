//
//  LookupViewBuilder.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 03/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import UIKit

class LookupViewBuilder {
    
    let parentView: UIView
    
    lazy var backgroundImageExplanationHeightConstraint = {
        return backgroundImageInfoContainer.heightAnchor.constraint(lessThanOrEqualToConstant: 120)
    }()
    
    lazy var orbitalPeroidLabel: UILabel = {
        let label = UILabel().layoutable()
        return label
    }()
    
    lazy var periheliumDistanceLabel: UILabel = {
        let label = UILabel().layoutable()
        return label
    }()
    
    lazy var apheliumDistanceLabel: UILabel = {
        let label = UILabel().layoutable()
        return label
    }()
    
    lazy var orbitalDataStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            orbitalPeroidLabel,
            periheliumDistanceLabel,
            apheliumDistanceLabel
        ]).layoutable()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.alpha = 1
        return stackView
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView().layoutable()
        imageView.backgroundColor = .white
        return imageView
    }()
    
    lazy var backgroundImageTitleLabel: UILabel = {
        let label = UILabel().layoutable()
        return label
    }()
    
    lazy var backgroundImageExplanationLabel: UILabel = {
        let label = UILabel().layoutable()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var backgroundImageInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            backgroundImageTitleLabel,
            backgroundImageExplanationLabel
        ]).layoutable()
        
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alpha = 0.5
        stackView.backgroundColor = .white
        return stackView
    }()
    
    lazy var backgroundImageInfoContainer: UIView = {
        let view = UIView().layoutable()
        view.backgroundColor = .white
        view.alpha = 0.5
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var orbitalDataContainer: UIView = {
        let view = UIView().layoutable()
        view.backgroundColor = .white
        view.alpha = 0.5
        return view
    }()
    
    init(with parentView: UIView) {
        self.parentView = parentView
    }
    
    func build() {
        backgroundImageInfoContainer.addSubview(backgroundImageInfoStackView)
        orbitalDataContainer.addSubview(orbitalDataStackView)
        parentView.addSubview(backgroundImageInfoContainer)
        parentView.addSubview(orbitalDataContainer)
        parentView.addSubview(backgroundImageView)
        parentView.sendSubviewToBack(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.bottomAnchor),
            
            orbitalDataContainer.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            orbitalDataContainer.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            orbitalDataContainer.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            
            backgroundImageInfoContainer.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            backgroundImageInfoContainer.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            backgroundImageInfoContainer.bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
            backgroundImageExplanationHeightConstraint
        ])
        orbitalDataStackView.edges(equalTo: orbitalDataContainer)
        backgroundImageInfoStackView.edges(equalTo: backgroundImageInfoContainer)
    }
}

extension UIView {
    
    func layoutable() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func edges(equalTo other: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: other.topAnchor),
            self.leadingAnchor.constraint(equalTo: other.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: other.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: other.bottomAnchor)
            ])
    }
}
