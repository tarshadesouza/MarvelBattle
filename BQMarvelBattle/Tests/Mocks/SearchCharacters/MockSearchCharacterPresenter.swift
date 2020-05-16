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
    weak var viewController: SearchCharactersDisplayLogic?
    
    var searchResultsPresented = false
    var characters = [Character]()
    func presentSearchResults(response: SearchCharacters.Model.Response) {
        searchResultsPresented = true
        characters = response.characters ?? [Character]()
    }
    
    var defaultCharactersShown = false
    func showLocalDefaultCharacters(response: SearchCharacters.Model.Response) {
        defaultCharactersShown = true
        characters = response.characters ?? [Character]()
    }
    
    var presentError = false
    var appError = AppError.genericError
    func showError(with error: AppError) {
        presentError = true
        appError = error
    }
}
