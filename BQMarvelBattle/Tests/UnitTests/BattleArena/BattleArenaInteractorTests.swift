//
//  BattleArenaInteractorTests.swift
//  BQMarvelBattleTests
//
//  Created by Tarsha De Souza on 15/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import XCTest
@testable import BQMarvelBattle
import ObjectMapper

class BattleArenaInteractorTests: XCTestCase {
    
    private var mockPresenter: MockBattleArenaPresenter!
    private var battleArenaInteractor: BattleArenaInteractor!
    private var mockRepository: Repository!
    var mockCharacters: [Character]!
    
    override func setUp() {
        mockPresenter = MockBattleArenaPresenter()
        mockRepository = LocalRepository()
        battleArenaInteractor = BattleArenaInteractor()
        battleArenaInteractor.presenter = mockPresenter
        battleArenaInteractor.repository = mockRepository
    }
    
    override func tearDown() {
        mockPresenter = nil
        battleArenaInteractor = nil
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
    
    func test_determineWinner() {
        //Given
        let mockCharacters = getMockCharacters()
        let request = BattleArena.Model.Request(fighters: mockCharacters)

        //When
        battleArenaInteractor.determineWinner(request: request)
        
        //Then
        XCTAssertTrue(mockPresenter.battleWinner.name == "3-D Man" && mockPresenter.isWinnerPresented, "winner was determined incorrectly winner ended up being \(mockPresenter.battleWinner.name)")
    }
    
    func test_writeAndReadToFile() {
        //Given
        let mockCharacters = getMockCharacters()
        
        //When
       let battleSummary = battleArenaInteractor.writeAndReadToFile(fighters: mockCharacters)
        
        //Then
        guard let finalSummary = battleSummary else {
            return XCTAssertThrowsError("battleSummary should not be nil!")
        }
        
        if finalSummary.contains(where: { $0.name == "3-D Man" }) {
        } else {
             return XCTAssertThrowsError("finalSummary doesnt include 3-D Man")
        }
    }
}
