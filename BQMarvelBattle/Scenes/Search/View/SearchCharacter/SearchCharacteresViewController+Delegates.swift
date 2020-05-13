//
//  SearchCharacteresViewController+Delegates.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 13/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

//MARK: Tableview Delegate methods
extension SearchCharactersViewController: SearchCharactersDelegate {
    
    func didSelectCharacter(at index: IndexPath) {
        searchBar.resignFirstResponder()
        
        guard let character = characters?[index.row] else {
            // TODO: Error handling
            return
        }
        
        if isBattle {
            battleArray.append(character)
            numberOfFighters = tableView.indexPathsForSelectedRows?.count ?? 0
        } else {
            self.router?.showCharacterDetail(with: character)
        }
    }
    
    func didDeSelectCharacter(at index: IndexPath) {
        guard let character = characters?[index.row] else {
            // TODO: Error handling
            return
        }
        
        if let index = battleArray.firstIndex(of: character) {
            battleArray.remove(at: index)
        }
    }
}

//MARK: SearchBar Delegate methods
extension SearchCharactersViewController: UISearchBarDelegate {
    
    //MARK: SearchBar Delegates
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keySearch = searchBar.text else {return}
        searchBar.endEditing(true)
        searchForCharacters(with: keySearch)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

//MARK: Pop Up Delegate methods
extension SearchCharactersViewController: PopUpDelegate {
    
    func userDidTapGoOutButton() {
        isEditingFighterList = true
    }
    
    func userDidTapGoToButton() {
        self.router?.goToFightBattle(with: battleArray)
    }
}

