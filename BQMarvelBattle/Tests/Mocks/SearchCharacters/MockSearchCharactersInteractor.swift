//
//  MockSearchCharactersInteractor.swift
//  BQMarvelBattleTests
//
//  Created by Tarsha De Souza on 16/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import XCTest
@testable import BQMarvelBattle

class MockSearchCharactersInteractor: SearchCharactersBusinessLogic, SearchCharactersDataStore {

    var presenter: SearchCharactersPresentationLogic?
    var repository: Repository?
   
    var isSearched = false
    func searchCharacterNames(request: SearchCharacters.Model.Request) {
        isSearched = true
    }
    
    var isSearchedAll = false
    func searchAllCharacters() {
        isSearchedAll = true
    }

}
