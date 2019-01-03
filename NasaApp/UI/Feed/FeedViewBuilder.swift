//
//  ViewBuilder.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import UIKit

class FeedViewBuilder {
    
    lazy var startDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    lazy var endDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    lazy var startDateTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.inputView = startDatePicker
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var endDateTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.inputView = endDatePicker
        textField.textAlignment = .center
        return textField
    }()
    
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
        parentView.addSubview(startDateTextField)
        parentView.addSubview(endDateTextField)
        
        NSLayoutConstraint.activate([
            startDateTextField.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            startDateTextField.trailingAnchor.constraint(equalTo: parentView.centerXAnchor),
            startDateTextField.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            startDateTextField.heightAnchor.constraint(equalToConstant: 40),
            
            endDateTextField.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            endDateTextField.heightAnchor.constraint(equalToConstant: 40),
            endDateTextField.leadingAnchor.constraint(equalTo: parentView.centerXAnchor),
            endDateTextField.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: startDateTextField.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        ])
    }
    
    
}
