//
//  ListViewController.swift
//  nest-collectionview-in-tableviewcell
//
//  Created by yunhao on 2020/10/28.
//

import UIKit

class ListViewController: UITableViewController {

    var items: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ListViewCell.self, forCellReuseIdentifier: "ListViewCell")
        
        // Init data.
        for i in 0..<20 {
            let totalTags = i + 6
            // Tags for each cell.
            let tags = (0..<totalTags).map { "tag\($0)" }
            items.append(tags)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell

        cell.titleLabel.text = "Title \(indexPath.row)"
        cell.subtitleLabel.text = "Subtitle \(indexPath.row)"
        cell.setTags(items[indexPath.row])
        
        return cell
    }

}
