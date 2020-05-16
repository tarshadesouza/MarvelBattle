//
//  SearchCharactersPresenterTests.swift
//  BQMarvelBattleTests
//
//  Created by Tarsha De Souza on 16/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import XCTest
@testable import BQMarvelBattle

class SearchCharactersPresenterTests: XCTestCase {

    private var presenter: SearchCharactersPresenter!
    private var mockView: MockSearchCharactersViewController!
    private var mockRepository: Repository!
    var mockCharacters: [Character]!
    
    override func setUp() {
        mockRepository = LocalRepository()
        presenter = SearchCharactersPresenter()
        mockView = MockSearchCharactersViewController()
        presenter.viewController = mockView
    }

    override func tearDown() {
        mockRepository = nil
        presenter = nil
        mockView = nil
        mockRepository = nil
    }
    
    func getMockCharacters() -> [Character] {
        mockRepository.retrieveAllCharacters(path: "mockCharacter") { (characters, error) in
            guard error == nil else {
                XCTAssertThrowsError("Couldnt retrieve mock character")
                return
            }
            guard let characters = characters else {
                XCTAssertThrowsError("No mock characters")
                return
            }
            self.mockCharacters = characters
        }
        return mockCharacters
    }
    
    func test_presentSearchResults() {
        //Given
        let characters = getMockCharacters()
        let response = SearchCharacters.Model.Response(characters: characters)
        
        //When
        presenter.presentSearchResults(response: response)
        
        //Then
        XCTAssertTrue(mockView.isDataDisplayed, "Data was not displayed")
        XCTAssertTrue(!mockView.displayedData.isEmpty, "Data was empty..")
    }
    
    func test_showError() {
        //Given
        let appError = AppError.notFoundError
        
        //When
        presenter.showError(with: appError)
        
        //Then
        XCTAssertTrue(mockView.isErrorShown, "Error was not shown")
        XCTAssertTrue(mockView.appError.description == AppError.notFoundError.description, "Incorrect type of app error was sent")
    }

}
