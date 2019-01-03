//
//  FeedTableViewController.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import UIKit

protocol FeedTableViewControllerDelegate: class {
    func feedTableView(_ tableView: UITableView, didSelectiCellWith model: Asteroid)
}

class FeedTableViewController: NSObject {
    
    let tableView: UITableView
    
    weak var delegate: FeedTableViewControllerDelegate?
    
    init(tableView: UITableView, delegate: FeedTableViewControllerDelegate) {
        self.tableView = tableView
        self.delegate = delegate
    }
    
    var data: [AsteroidDayData] = [] {
        didSet {
            data.sort { $0.dayDate! < $1.dayDate! }
            tableView.reloadData()
        }
    }
}

extension FeedTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].objects.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.id, for: indexPath) as? FeedCell {
            cell.configure(with: data[indexPath.section].objects[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
}

extension FeedTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].dayString
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.feedTableView(tableView, didSelectiCellWith: data[indexPath.section].objects[indexPath.row])
    }
}
