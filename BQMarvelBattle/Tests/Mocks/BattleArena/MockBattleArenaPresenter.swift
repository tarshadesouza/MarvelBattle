//
//  MockBattleArenaPresenter.swift
//  BQMarvelBattleTests
//
//  Created by Tarsha De Souza on 15/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import XCTest
@testable import BQMarvelBattle

class MockBattleArenaPresenter: BattleArenaPresentationLogic {
   
    var viewController: BattleArenaDisplayLogic?
    
    var isWinnerPresented = false
    var battleWinner: Character!
    func presentWinner(response: BattleArena.Model.Response) {
        battleWinner = response.winner
        isWinnerPresented = true
    }
}
