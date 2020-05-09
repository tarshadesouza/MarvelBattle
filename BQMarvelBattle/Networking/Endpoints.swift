//
//  Endpoints.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 9/5/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire

enum MarvelBattleEndPoints {
    case retrieveData
    case retrieveCharactersViaName(queryString: String)
}

extension MarvelBattleEndPoints {
  
    var httpMethod: HTTPMethod {
       switch self {
       case .retrieveData:
           return .get
       case .retrieveCharactersViaName:
           return .get
       }
   }
    
    var baseURLString: String {
        switch self {
        case .retrieveData:
                return "https://gateway.marvel.com"
        case.retrieveCharactersViaName:
            return "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith="
        }
    }
    
    var params: [String: Any]? {
        switch self {
        case .retrieveData:
            return nil
        case .retrieveCharactersViaName(let query):
            let params = ["nameStartsWith" : query]
            return params
        }
    }
    
}

