//
//  OfflineSources.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 13/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

class OfflineSources {
    
    enum JSONFilenames: String {
        case authToken
    }
    
    static func getJSONFileName(forEndpoint endpoint: MarvelBattleEndPoints) -> String? {
        return OfflineSources.getLocalJSONFileName(from: endpoint.path)
    }
    
    static func getLocalJSONFileName(from userText: String) -> String {
        return userText.replacingOccurrences(of: "file://", with: "")
    }
    
    static func loadLocalJSONFile(forEndpoint endpoint: MarvelBattleEndPoints) -> (data: Any?, error: Error?) {
        guard let jsonFileName = OfflineSources.getJSONFileName(forEndpoint: endpoint) else {
            
            return (nil, nil)
        }
        guard let jsonData = LocalFilesUtils.readLocalJSONFile(name: jsonFileName) else {
            
            return (nil, nil)
        }
        guard let json = OfflineSources.jsonData(forData: jsonData) else {
            
            return (nil, nil)
        }
        return (json, nil)
    }
    
    private static func jsonData(forData data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            return nil
        }
    }
}
