//
//  BattleArenaViewConroller+Delegates.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 13/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

// MARK: Pop Up Delegate
extension BattleArenaViewController: PopUpDelegate {
    func userDidTapGoOutButton() {
        
    }
    
    func userDidTapGoToButton() {
        self.router?.goToRankings()
    }
}
