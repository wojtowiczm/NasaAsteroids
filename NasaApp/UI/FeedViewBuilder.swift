//
//  ViewBuilder.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import UIKit

class FeedViewBuilder {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(FeedCell.self, forCellReuseIdentifier: FeedCell.id)
        return tableView
    }()
    let parentView: UIView
    
    init(parentView: UIView) {
        self.parentView = parentView
    }
    
    func build() {
        parentView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: parentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        ])
    }
    
    
}
