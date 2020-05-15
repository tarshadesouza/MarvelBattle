//
//  SearchCharactersRouter.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 9/5/20.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchCharactersRoutingLogic {
    func showCharacterDetail(with character: Character)
    func goToBattleArena()
    func goToFightBattle(with fighters: [Character])
    func goToRankings()
    func presentBattlePopUp()
}

protocol SearchCharactersDataPassing {
    var dataStore: SearchCharactersDataStore? { get }
}

class SearchCharactersRouter: NSObject, SearchCharactersRoutingLogic, SearchCharactersDataPassing{
    weak var viewController: SearchCharactersViewController?
    var dataStore: SearchCharactersDataStore?
    
    func showCharacterDetail(with character: Character) {
        guard let SearchViewController = viewController else { return }
        let characterDetailVC = CharacterDetailViewController()
        characterDetailVC.character = character
        SearchViewController.show(characterDetailVC, sender: self)
    }
    
    func goToBattleArena() {
        guard let SearchViewController = viewController else { return }
        let battleArenaVC = BattleArenaViewController()
        SearchViewController.show(battleArenaVC, sender: self)
    }
    
    func goToFightBattle(with fighters: [Character]) {
        guard let SearchViewController = viewController else { return }
        let battleArenaVC = BattleArenaViewController()
        battleArenaVC.fighters = fighters
        SearchViewController.show(battleArenaVC, sender: self)
    }
    
    func presentBattlePopUp() {
        guard let SearchViewController = viewController else { return }
        
        let bundle = Bundle(for: type(of: self))
        if let popUp = bundle.loadNibNamed(ReadyToBattlePopUpView.defaultReuseIdentifier, owner: self, options: nil)?.first as? ReadyToBattlePopUpView {
            SearchViewController.view.addSubview(popUp)
            SearchViewController.view.bringSubviewToFront(popUp)
            
            popUp.configurePopUp(text: "You have chosen your two fighters", buttonText: "I´m ready to battle")
            popUp.translatesAutoresizingMaskIntoConstraints = false
            
            popUp.topAnchor.constraint(equalTo: SearchViewController.view.topAnchor)
                .isActive = true
            popUp.leadingAnchor.constraint(equalTo: SearchViewController.view.leadingAnchor)
                .isActive = true
            popUp.bottomAnchor.constraint(equalTo: SearchViewController.view.bottomAnchor)
                .isActive = true
            popUp.trailingAnchor.constraint(equalTo: SearchViewController.view.trailingAnchor)
                .isActive = true
            popUp.delegate = SearchViewController
        }
    }
    
    func goToRankings() {
        guard let SearchViewController = viewController else { return }
        let rankingsVC = RankingsViewController()
        SearchViewController.show(rankingsVC, sender: self)
    }
}
