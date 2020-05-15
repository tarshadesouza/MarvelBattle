//
//  RankingsViewController+Delegates.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 15/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

//MARK: Tableview Delegate methods

extension RankingsViewController: SearchCharactersDelegate {
    func didSelectCharacter(at index: IndexPath) {
        guard let character = battleSummary?[index.row] else {
            self.presentAlert(withTitle: AppError.resourceLoadingError.title, message: AppError.resourceLoadingError.description)
            return
        }
        self.router?.showCharacterDetail(with: character)
    }
    
    func didDeSelectCharacter(at index: IndexPath) {
        //
    }
}
