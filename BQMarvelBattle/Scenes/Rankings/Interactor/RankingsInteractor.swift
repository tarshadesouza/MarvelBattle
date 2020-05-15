//
//  RankingsInteractor.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 9/5/20.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import ObjectMapper

protocol RankingsBusinessLogic {
    func retrieveRankings()
}

protocol RankingsDataStore {
    var BattleSummary: [Character]? { get set }
}

class RankingsInteractor: RankingsBusinessLogic, RankingsDataStore {
    var presenter: RankingsPresentationLogic?
    var BattleSummary: [Character]?
    
    func retrieveRankings() {
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        let fileUrl = documentDirectoryUrl.appendingPathComponent("BattleChallenges.json")
        let battleArray = retrieveFromJsonFile(fileUrl: fileUrl) { (battleSummary, error) -> [Character]? in
            if error != nil {
                return (nil)
            }
            return (battleSummary)
        }
        guard let battleSummary = battleArray else {
            presenter?.showError(error: AppError.genericError)
            return
        }
        let response = Rankings.Model.Response(rankings: battleSummary)
        presenter?.presentRankings(response: response)
    }
}

extension RankingsInteractor: RankingsGeneralProtocol {
    func retrieveFromJsonFile(fileUrl: URL, completion: @escaping ([Character]?, Error?) -> [Character]?) -> [Character]? {
        var battlesArray = [Character]()
        // Read data from .json file and transform data into an array
        do {
            let data = try Data(contentsOf: fileUrl, options: [])
            guard let results = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                return completion(nil, AppError.resourceLoadingError)
            }
            
            if let fighters = results["results"] as? Array<Dictionary<String,AnyObject>> {
                fighters.forEach { fighter in
                    guard let character = Mapper<Character>().map(JSON: fighter) else {
                        return
                    }
                    battlesArray.append(character)
                }
            }
            return completion(battlesArray, nil)
        } catch {
            return completion(nil, AppError.resourceLoadingError)
        }
    }
}