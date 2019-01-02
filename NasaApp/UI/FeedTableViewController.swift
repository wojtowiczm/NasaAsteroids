//
//  FeedTableViewController.swift
//  NasaApp
//
//  Created by Michał Wójtowicz on 02/01/2019.
//  Copyright © 2019 Michał Wójtowicz. All rights reserved.
//

import UIKit

class FeedTableViewController: NSObject {
    
    let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    var data: [AsteroidDayData] = [] {
        didSet { tableView.reloadData() }
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
            
   //     }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
}

extension FeedTableViewController: UITableViewDelegate {}
