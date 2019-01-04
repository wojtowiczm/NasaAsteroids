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
    
    lazy var orbitalPeroidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var periheliumDistanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var apheliumDistanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var orbitalDataStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            orbitalPeroidLabel,
            periheliumDistanceLabel,
            apheliumDistanceLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.alpha = 1
        return stackView
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    
    lazy var backgroundImageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backgroundImageExplanationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backgroundImageInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            backgroundImageTitleLabel,
            backgroundImageExplanationLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alpha = 0.5
        stackView.backgroundColor = .white
        return stackView
    }()
    
    init(with parentView: UIView) {
        self.parentView = parentView
    }
    
    func build() {
        parentView.addSubview(orbitalDataStackView)
        parentView.addSubview(backgroundImageInfoStackView)
        parentView.addSubview(backgroundImageView)
        parentView.sendSubviewToBack(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.bottomAnchor),
            
            orbitalDataStackView.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            orbitalDataStackView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            orbitalDataStackView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            
            backgroundImageInfoStackView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            backgroundImageInfoStackView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            backgroundImageInfoStackView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        ])
    }
}
