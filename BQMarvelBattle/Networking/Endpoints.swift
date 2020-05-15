//
//  Endpoints.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 9/5/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire
import Keys
import CryptoSwift

fileprivate struct MarvelAPIConfig {
    fileprivate static let keys = BQMarvelBattleKeys()
    static let privatekey = keys.marvelPrivateKey
    static let apikey = keys.marvelApiKey
    static let ts = Date().timeIntervalSince1970.description
    static let hash = "\(ts)\(privatekey)\(apikey)".md5()
}

enum MarvelBattleEndPoints {
    case retrieveLocalAllCharacters(path: String)
    case retrieveCharactersViaName(queryString: String)
}

extension MarvelBattleEndPoints {
    
    func authParameters() -> [String: String] {
        return ["apikey": MarvelAPIConfig.apikey,
                "ts": MarvelAPIConfig.ts,
                "hash": MarvelAPIConfig.hash]
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .retrieveLocalAllCharacters:
            return .get
        case .retrieveCharactersViaName:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .retrieveLocalAllCharacters (let path):
            return path
        case .retrieveCharactersViaName:
            return "/v1/public/characters"
        }
    }
    
    var baseURLString: String {
        switch self {
        case .retrieveLocalAllCharacters:
            return "https://gateway.marvel.com:443"
        case.retrieveCharactersViaName:
            return "https://gateway.marvel.com:443"
        }
    }
    
    var params: [String: Any]? {
        switch self {
        case .retrieveLocalAllCharacters:
            return nil
        case .retrieveCharactersViaName(let query):
            var params = ["nameStartsWith" : query]
            params.merge(dict: authParameters())
            return params
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try baseURLString.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = httpMethod.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: params)
    }
}
