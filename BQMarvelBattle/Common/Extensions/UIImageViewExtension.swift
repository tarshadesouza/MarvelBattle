//
//  UIImageViewExtension.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 12/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

extension UIImageView {
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
