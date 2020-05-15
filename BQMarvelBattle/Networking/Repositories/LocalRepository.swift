//
//  LocalRepository.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 9/5/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import ObjectMapper

enum Result<T> {
    case success(T)
    case failure(Error)
}

struct LocalRepository : Repository {
    
    func retrieveAllCharacters(path: String, completion: @escaping ([Character]?, Error?) -> Void) {
        print("LOCAL REPO WAS CALLED")
        let queryObj = MarvelBattleEndPoints.retrieveLocalAllCharacters(path: path)
        let result = loadLocalJSONFile(forEndpoint: queryObj)
        switch result {
        case .success(let value):
            guard let characters = handleResponse(with: value) else {
                completion(nil, AppError.genericError)
                return
            }
            completion(characters, nil)
            
        case .failure(let error):
            completion(nil, error)
        }
    }
    
    func retrieveCharactersViaName(queryString: String, completion: @escaping ([Character]?, Error?) -> Void) {
    }
    
    func loadLocalJSONFile(forEndpoint endpoint: MarvelBattleEndPoints) -> Result<Any> {
        let jsonData = OfflineSources.loadLocalJSONFile(forEndpoint: endpoint)
        guard let data = jsonData.data, jsonData.error == nil else {
            let errorDescription = jsonData.error?.localizedDescription
            return Result.failure(AppError.dataParsingError(errorDescription))
        }
        return Result.success(data as Any)
    }
    
    func handleResponse(with value: Any) -> [Character]? {
        var characters = [Character]()
        if let jsonDict = value as? [String:AnyObject] {
            if let data = jsonDict["data"] as? [String:AnyObject] {
                if let results = data["results"] as?  Array<Dictionary<String,AnyObject>> {
                    results.forEach { result in
                        guard let character = Mapper<Character>().map(JSON: result) else {
                            return
                        }
                        characters.append(character)
                    }
                    return characters
                }
            }
        }
        return nil
    }
}
