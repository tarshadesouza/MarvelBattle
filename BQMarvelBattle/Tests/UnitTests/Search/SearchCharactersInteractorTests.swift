//
//  SearchCharactersInteractorTests.swift
//  BQMarvelBattleTests
//
//  Created by Tarsha De Souza on 16/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import XCTest
@testable import BQMarvelBattle
import ObjectMapper
import Alamofire

class SearchCharactersInteractorTests: XCTestCase {
    
    private var mockPresenter: MockSearchCharacterPresenter!
    private var searchCharactersInteractor: SearchCharactersInteractor!
    private var mockRepository: Repository!
    var mockCharacters: [Character]!
    
    override func setUp() {
        mockPresenter = MockSearchCharacterPresenter()
        searchCharactersInteractor = SearchCharactersInteractor()
        searchCharactersInteractor.presenter = mockPresenter
        mockRepository = LocalRepository()
    }
    
    override func tearDown() {
        mockPresenter = nil
        searchCharactersInteractor = nil
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
    
    func test_searchCharacterNames_OK() {
        //Given
        mockRepository = RemoteRepository()
        let request = SearchCharacters.Model.Request(characterName: "spider")
        //When
        searchCharactersInteractor.searchCharacterNames(request: request)
        
        //Then
        expectToEventually(self.mockPresenter.searchResultsPresented == true && self.mockPresenter.characters.isEmpty == false , timeout: 5.0, message: "An error occured so the presenter was not sent any valid response")
    }
    
    func test_searchCharacterNames_KO() {
        //Given
        mockRepository = RemoteRepository()
        let request = SearchCharacters.Model.Request(characterName: "asdfasdfasdf")
        
        //When
        searchCharactersInteractor.searchCharacterNames(request: request)
        
        //Then
        expectToEventually(mockPresenter.presentError, timeout: 5.0, message: "\(request) should not exist or be a valid request")
        expectToEventually(self.mockPresenter.appError.description == AppError.notFoundError.description, timeout: 5.0, message: "Wrong App error was displayed")
    }
}
