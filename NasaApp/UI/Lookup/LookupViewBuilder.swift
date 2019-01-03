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
        let stackView = UIStackView(arrangedSubviews: [orbitalPeroidLabel, periheliumDistanceLabel, apheliumDistanceLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    
    init(with parentView: UIView) {
        self.parentView = parentView
    }
    
    func build() {
        parentView.addSubview(orbitalDataStackView)
        parentView.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.bottomAnchor),
            
            orbitalDataStackView.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            orbitalDataStackView.centerYAnchor.constraint(equalTo: parentView.centerYAnchor)
        ])
    }
}
