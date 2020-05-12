//
//  NibExtension.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 12/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

extension UINib {
    class func from(_ nibName: String) -> UINib? {
        guard !nibName.isEmpty else {
            return nil
        }
        
        return UINib(nibName: nibName, bundle: nil)
    }
}
