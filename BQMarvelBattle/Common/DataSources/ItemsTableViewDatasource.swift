//
//  ItemsTableViewDatasource.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 11/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

protocol ItemsTableViewDatasource: UITableViewDataSource {
    associatedtype T
    var items:[T]? {get}
    var tableView: UITableView? {get}
    var delegate: UITableViewDelegate? {get}
    
    init(items: [T]?, tableView: UITableView, delegate: UITableViewDelegate)
    
    func setupTableView()
}

extension ItemsTableViewDatasource {
    func setupTableView() {
        self.tableView?.dataSource = self
        self.tableView?.delegate = self.delegate
        self.tableView?.reloadData()
    }
}
