//
//  LocalFilesUtils.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 13/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

class LocalFilesUtils {
    
    enum LocalFileExtension: String {
        case JSON = "json"
    }
    
    static func readLocalJSONFile(name: String) -> Data? {
        return LocalFilesUtils.readLocalFile(name: name, type: LocalFileExtension.JSON)
    }
    
    static func readLocalFile(name: String, type: LocalFileExtension) -> Data? {
        guard !name.isEmpty,
            let pathString = Bundle(for: self).path(forResource: name, ofType: type.rawValue),
            let jsonString = try? NSString(contentsOfFile: pathString, encoding: String.Encoding.utf8.rawValue),
            let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue) else {
                return nil
        }
        return jsonData
    }
}
