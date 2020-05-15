//
//  RemoteRepository.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 9/5/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

protocol Repository {
    func retrieveAllCharacters(path: String, completion: @escaping ([Character]?, Error?) -> Void)
    func retrieveCharactersViaName(queryString: String, completion: @escaping ([Character]?, Error?) -> Void)
    func handleResponse(with value: Any) -> [Character]?
}

/// Manages connection to the backend
struct RemoteRepository: Repository {
    
    func retrieveAllCharacters<T>(path: String, completion: @escaping (T?, Error?) -> Void) {
    }
    
    func retrieveCharactersViaName(queryString: String, completion: @escaping ([Character]?, Error?) -> Void) {
        let queryObj = MarvelBattleEndPoints.retrieveCharactersViaName(queryString: queryString)
        
        guard let request = try? queryObj.asURLRequest() else {
            return
        }
     
        Alamofire.request(request).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value) :
                guard let characters = self.handleResponse(with: value) else {
                    completion(nil, AppError.genericError)
                    return
                }
                completion(characters, nil)
            case.failure(let error):
                completion(nil, error)
            }
        }
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
                    if !characters.isEmpty {
                        return characters
                    } else {
                        return nil
                    }
                }
            }
        }
        return nil
    }
}
