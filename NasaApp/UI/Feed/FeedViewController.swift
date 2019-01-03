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
    
    lazy var tableController = FeedTableViewController(tableView: viewBuilder.tableView, delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBuilder.build()
        bindViewModel()
        setupView()
        bindView()
        viewModel.fetchAsteroids()
    }
    
    private func setupView() {
        viewBuilder.startDateTextField.text = viewModel.startDate.with(format: .api)
        viewBuilder.endDateTextField.text = viewModel.endDate.with(format: .api)
        viewBuilder.startDatePicker.date = viewModel.startDate
        viewBuilder.endDatePicker.date = viewModel.endDate
        title = "Feed"
    }

    private func bindView() {
        viewBuilder.startDatePicker.addTarget(self, action: #selector(startDatePicked(_:)), for: .valueChanged)
        viewBuilder.endDatePicker.addTarget(self, action: #selector(endDatePicked(_:)), for: .valueChanged)
        viewBuilder.tableView.dataSource = tableController
        viewBuilder.tableView.delegate = tableController
    }
    func bindViewModel() {
        viewModel.dataChanged = { [weak self] objectsNearEarth in
            self?.tableController.data = objectsNearEarth.data
        }
        
        viewModel.datesUpdated = { [weak self] startDate, endDate in
            self?.viewBuilder.startDateTextField.text = startDate.with(format: .api)
            self?.viewBuilder.endDateTextField.text = endDate.with(format: .api)
            self?.viewBuilder.startDatePicker.date = startDate
            self?.viewBuilder.endDatePicker.date = endDate
        }
    }
    
    @objc func startDatePicked(_ picker: UIDatePicker) {
        viewModel.startDate = picker.date
    }
    
    @objc func endDatePicked(_ picker: UIDatePicker) {
        viewModel.endDate = picker.date
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func navigateToLookup(with asteroidId: String) {
        let lookupViewController = LookupViewController(with: asteroidId)
        navigationController?.pushViewController(lookupViewController, animated: true)
    }
}

extension FeedViewController: FeedTableViewControllerDelegate {
    
    func feedTableView(_ tableView: UITableView, didSelectiCellWith model: Asteroid) {
        navigateToLookup(with: model.id)
    }
}

