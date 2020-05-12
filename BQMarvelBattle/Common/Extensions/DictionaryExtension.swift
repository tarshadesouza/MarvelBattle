//
//  DictionaryExtension.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 11/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
