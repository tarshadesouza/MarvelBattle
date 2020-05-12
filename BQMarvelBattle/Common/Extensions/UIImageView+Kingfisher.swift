//
//  UIImageView+Kingfisher.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 12/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func download(image url: String) {
        guard let imageURL = URL(string:url) else {
            return
        }
        self.kf.setImage(with: ImageResource(downloadURL: imageURL))
    }
}
