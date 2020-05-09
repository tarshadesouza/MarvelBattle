//
//  LocalRepository.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 9/5/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol Repository {
    func retrieveData<T: Decodable>(path: String, completion: @escaping (T?, Error?) -> Void)
    func retrieveCharactersViaName<T: Decodable>(queryString: String, completion: @escaping (T?, Error?) -> Void)
}

/// Manages connection to the backend
struct RemoteRepository: Repository {
    
    func retrieveData<T>(path: String, completion: @escaping (T?, Error?) -> Void) where T : Decodable {
        //alamofire call here
    }
    
    func retrieveCharactersViaName<T>(queryString: String, completion: @escaping (T?, Error?) -> Void) where T : Decodable {
        let queryObj = MarvelBattleEndPoints.retrieveCharactersViaName(queryString: queryString)
        
        Alamofire.request(queryObj.baseURLString, method: queryObj.httpMethod, parameters: queryObj.params, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value) :
                
                if let jsonDict = value as? [String:AnyObject] {
                    if let results = jsonDict["results"] as? Array<Dictionary<String,String>> {
                        print("RESULTS SUCCESFULLY FOUND", results)
                    }
                }
                
            case.failure(let error):
                print("ERROR API CALLED FAILED", error)
            }
        }
    }
    
}
