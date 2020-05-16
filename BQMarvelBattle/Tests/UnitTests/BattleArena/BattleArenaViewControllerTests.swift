//
//  BattleArenaViewControllerTests.swift
//  BQMarvelBattleTests
//
//  Created by Tarsha De Souza on 16/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import XCTest
@testable import BQMarvelBattle

class BattleArenaViewControllerTests: XCTestCase {
    
    private var battleArenaViewController: BattleArenaViewController!
    private var mockPresenter: MockBattleArenaPresenter!
    private var mockInteractor: MockBattleArenaInteractor!
    private var mockRepository: Repository!
    var mockCharacters: [Character]!
    
    override func setUp() {
        mockRepository = LocalRepository()
        battleArenaViewController = BattleArenaViewController()
        mockInteractor = MockBattleArenaInteractor()
        mockPresenter = MockBattleArenaPresenter()
        mockInteractor.presenter = mockPresenter
        mockPresenter.viewController = battleArenaViewController
        
        battleArenaViewController.interactor = mockInteractor
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

    override func tearDown() {
        battleArenaViewController = nil
        mockPresenter = nil
        mockInteractor = nil
        mockRepository = nil
        mockCharacters = nil
    }
    
    func test_getWinner() {
        //G
        let fighters = getMockCharacters()
        battleArenaViewController.fighters = fighters
        //W
        battleArenaViewController.getWinner()
        
        //T
        XCTAssertTrue(mockInteractor.winnerIsDetermined, "Interactor was not reached")
        XCTAssertNotNil(mockInteractor.fighterRequests, "Nothing was sent in request.")
    }
}
