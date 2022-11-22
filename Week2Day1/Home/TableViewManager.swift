//
//  TableViewManager.swift
//  Week2Day1
//
//  Created by Default on 11/21/22.
//

import Foundation
import UIKit

protocol TableViewManagerProtocol :AnyObject, UITableViewDataSource, UITableViewDelegate {
    func addPeople(_ newPeople: [String])
}

class TableViewManager: NSObject, TableViewManagerProtocol {
    
    var people = [String] ()
    var cellId = "cellIdentifier"
    
    func addPeople(_ newPeople: [String]) {
        people.append(contentsOf: newPeople)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }
    
//    func tableView(_ tableView: UITableView, numberOfSections) {
//        1
//    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) else {
            let _cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
            _cell.textLabel?.text = people[row]
            return _cell
        }
        cell.textLabel?.text = people[row]
        return cell
    }
}
