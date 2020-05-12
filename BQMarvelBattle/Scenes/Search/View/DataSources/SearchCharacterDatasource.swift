//
//  SearchCharacterDatasource.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 11/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

final class SearchCharacterDatasource: NSObject, ItemsTableViewDatasource {
    
    var items:[Character]? = []
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    
    init(items: [Character]?, tableView: UITableView, delegate: UITableViewDelegate) {
        super.init()
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        self.tableView?.register(cellIdentifier: CharacterTableViewCell.defaultReuseIdentifier)
        self.setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        guard let characters = items else {
            tableView.setEmptyView(title: "Looking For Your Hero?.", message: "start searching for your favorite Hero.")
            return 0
        }
      
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let character = self.items?[indexPath.row] else {
            return UITableViewCell()
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.defaultReuseIdentifier, for: indexPath) as? CharacterTableViewCell {
            cell.setUp(characterData: character)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

class SearchCharacterTableDelegate: NSObject, UITableViewDelegate {
    
    let delegate: SearchCharactersDelegate
    
    init(_ delegate: SearchCharactersDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterTableViewCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectCharacter(at: indexPath)
    }
}
