//
//  ResusableView.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 12/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

protocol ReusableViewProtocol: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableViewProtocol where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: ReusableViewProtocol { }
