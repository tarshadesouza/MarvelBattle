//
//  MockSearchCharactersViewController.swift
//  BQMarvelBattleTests
//
//  Created by Tarsha De Souza on 15/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import XCTest
@testable import BQMarvelBattle

class MockSearchCharactersViewController: SearchCharactersDisplayLogic {
    
    var isDataDisplayed = false
    var displayedData = [Character]()
    func displayData(viewModel: SearchCharacters.Model.ViewModel) {
        isDataDisplayed = true
        displayedData = viewModel.characters ?? [Character]()
    }
    
    var isErrorShown = false
    var appError = AppError.genericError
    func showError(error: AppError) {
        isErrorShown = true
        appError = error
    }
}
