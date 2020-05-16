//
//  MockBattleArenaInteractor.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 15/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import XCTest
@testable import BQMarvelBattle

class MockBattleArenaInteractor: BattleArenaBusinessLogic, BattleArenaDataStore, RankingsGeneralProtocol {

    var presenter: BattleArenaPresentationLogic?
    var repository: Repository?
    var BattleSummary: [Character]?
    
    var winnerIsDetermined = false
    var fighterRequests = [Character]()
    func determineWinner(request: BattleArena.Model.Request) {
        winnerIsDetermined = true
        fighterRequests = request.fighters
    }
    
    func calculateWinner(fighters: [Character]) -> Character {
        return Character()
    }
    
    func writeAndReadToFile(fighters: [Character]) -> ([Character]?) {
        return nil
    }
    
    func writeToFile(fighters: [String : [[String : Any]]], toFile fileUrl: URL) {
        
    }
    
    func retrieveFromJsonFile(fileUrl: URL, completion: @escaping ([Character]?, Error?) -> [Character]?) -> [Character]? {
        return nil
    }
    
}
