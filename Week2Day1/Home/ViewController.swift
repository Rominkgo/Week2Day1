//
//  ViewController.swift
//  Week2Day1
//
//  Created by Default on 11/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let _view = UITableView.init(frame: .zero)
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    } ()
    
    private let manager: TableViewManagerProtocol = TableViewManager()
    private let presenter = HomePresenter()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        configureTableView()
        fetchPeopleNames()
    }
    func fetchPeopleNames() {
        manager.addPeople(["Nick", "Judd", "Hugo", "Rolando", "David", "Mike", "Vanessa", "Alex", "Morgan", "Juan", "Manuel", "Romin", "David's Girlfriend(Error does not exist)" ])
        tableView.reloadData()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = manager
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ViewController: HomeViewProtocol {
    func onPeopleFetched(_ peopleNames: [String]) {
            manager.addPeople(peopleNames)
            tableView.reloadData()
        }
    }

