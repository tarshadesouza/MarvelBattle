//
//  BattleArenaPresenterTests.swift
//  BQMarvelBattleTests
//
//  Created by Tarsha De Souza on 15/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import XCTest
@testable import BQMarvelBattle

class BattleArenaPresenterTests: XCTestCase {
    
    private var presenter: BattleArenaPresenter!
    private var mockView: MockBattleArenaViewController!
    private var mockRepository: Repository!
    var mockCharacters: [Character]!
    
    override func setUp() {
        mockRepository = LocalRepository()
        presenter = BattleArenaPresenter()
        mockView = MockBattleArenaViewController()
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
    
    func test_presentWinner() {
        //Given
        let characters = getMockCharacters()
        let response = BattleArena.Model.Response(winner: characters[0])
        
        //When
        presenter.presentWinner(response: response)
        
        //Then
        XCTAssertTrue(mockView.isWinnerShown && mockView.chosenCharacter?.name == "3-D Man", "View was not shown and or wrong character was shown")
    }
}
