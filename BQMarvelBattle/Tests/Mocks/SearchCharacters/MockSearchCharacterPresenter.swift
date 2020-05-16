//
//  MockSearchCharacterPresenter.swift
//  BQMarvelBattleTests
//
//  Created by Tarsha De Souza on 15/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import XCTest
@testable import BQMarvelBattle

class MockSearchCharacterPresenter: SearchCharactersPresentationLogic {
   
    var searchResultsPresented = false
    func presentSearchResults(response: SearchCharacters.Model.Response) {
        searchResultsPresented = true
    }
    
    var defaultCharactersShown = false
    func showLocalDefaultCharacters(response: SearchCharacters.Model.Response) {
        defaultCharactersShown = true
    }
    
    var presentError = false
    func showError(with error: AppError) {
        presentError = true
    }
}
