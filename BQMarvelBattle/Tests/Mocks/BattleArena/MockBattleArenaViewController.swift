//
//  MockBattleArenaViewController.swift
//  BQMarvelBattleTests
//
//  Created by Tarsha De Souza on 15/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import XCTest
@testable import BQMarvelBattle

class MockBattleArenaViewController: BattleArenaDisplayLogic {
   
    var interactor: BattleArenaBusinessLogic?
    var router: (NSObjectProtocol & BattleArenaRoutingLogic & BattleArenaDataPassing)?
    var fighters: [Character]?
    
    var isWinnerShown = false
    var chosenCharacter: Character?
    func showWinner(viewModel: BattleArena.Model.ViewModel) {
        isWinnerShown = true
        chosenCharacter = viewModel.winner
    }
}
