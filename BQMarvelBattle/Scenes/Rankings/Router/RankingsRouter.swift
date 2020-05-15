//
//  RankingsRouter.swift
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

protocol RankingsRoutingLogic {
    func showCharacterDetail(with character: Character)
}

protocol RankingsDataPassing {
    var dataStore: RankingsDataStore? { get }
}

class RankingsRouter: NSObject, RankingsRoutingLogic, RankingsDataPassing {
    weak var viewController: RankingsViewController?
    var dataStore: RankingsDataStore?
    
    func showCharacterDetail(with character: Character) {
        guard let RankingsViewController = viewController else { return }
        let characterDetailVC = CharacterDetailViewController()
        characterDetailVC.character = character
        RankingsViewController.show(characterDetailVC, sender: self)
    }
}
