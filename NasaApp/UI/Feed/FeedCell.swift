//
//  FeedCell.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    static let id = "FeedCell"
    
    lazy var hazardousIndicator: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "●"
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var velocityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var distanceFromEarth: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var informationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, velocityLabel, distanceFromEarth])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(informationStackView)
        contentView.addSubview(hazardousIndicator)
        
        NSLayoutConstraint.activate([
            hazardousIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            hazardousIndicator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            hazardousIndicator.trailingAnchor.constraint(equalTo: informationStackView.leadingAnchor),
            hazardousIndicator.widthAnchor.constraint(equalToConstant: 40),
            informationStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            informationStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            informationStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    func configure(with model: Asteroid) {
        hazardousIndicator.textColor = model.isPotentiallyHazardous ? .red : .black
        nameLabel.text = "Name: \(model.name)"
        if let cloaseAproachData = model.closeAproachData.first {
            velocityLabel.text = "Velocity: \(cloaseAproachData.relativeVelocity.kilometersPerHour) km/h"
            distanceFromEarth.text = "Distance form earth: \(cloaseAproachData.missDistance.kilometers) km"
        }
    }
    
}
