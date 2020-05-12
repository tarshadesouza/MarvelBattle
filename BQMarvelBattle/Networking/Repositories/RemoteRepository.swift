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
    func retrieveData<T: Decodable>(path: String, completion: @escaping (T?, Error?) -> Void)
    func retrieveCharactersViaName(queryString: String, completion: @escaping ([Character]?, Error?) -> Void)
}

/// Manages connection to the backend
struct RemoteRepository: Repository {
    
    func retrieveData<T>(path: String, completion: @escaping (T?, Error?) -> Void) where T : Decodable {
        // TODO:alamofire call here
    }
    
    func retrieveCharactersViaName(queryString: String, completion: @escaping ([Character]?, Error?) -> Void) {
        let queryObj = MarvelBattleEndPoints.retrieveCharactersViaName(queryString: queryString)
        var characters = [Character]()
        
        guard let request = try? queryObj.asURLRequest() else {
            print("COULDNT MAKE REQUEST OBJ")
            // TODO: ERROR HANDLING
            return
        }

        Alamofire.request(request).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value) :
                
                if let jsonDict = value as? [String:AnyObject] {
                    if let data = jsonDict["data"] as? [String:AnyObject] {
                        if let results = data["results"] as?  Array<Dictionary<String,AnyObject>> {
                            
                            results.forEach { result in
                                
                                guard let character = Mapper<Character>().map(JSON: result) else {
                                    // TODO: Error handling
                                    completion(nil, nil)
                                    return
                                }
                                
                                // TODO: Finish mapping
                                characters.append(character)
                                print("this is the CHARACTER", character)
                            }
                            completion(characters, nil)
                        }
                    }
                }
            case.failure(let error):
                // TODO: ERROR HANDLING
                print("ERROR API CALLED FAILED", error)
                completion(nil, error)
            }
        }
    }
    
}
