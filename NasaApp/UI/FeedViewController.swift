//
//  ViewController.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    let viewModel = FeedViewModel()
    
    lazy var viewBuilder = FeedViewBuilder(parentView: self.view)
    
    lazy var tableController = FeedTableViewController(tableView: viewBuilder.tableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBuilder.build()
        bindViewModel()
        bindView()
        viewModel.fetchAsteroids(from: Date(), to: Date().addingTimeInterval(36000))
    }

    private func bindView() {
        viewBuilder.tableView.dataSource = tableController
        viewBuilder.tableView.delegate = tableController
    }
    func bindViewModel() {
        viewModel.dataChanged = { [weak self] objectsNearEarth in
            self?.tableController.data = objectsNearEarth.data
        }
    }
}

