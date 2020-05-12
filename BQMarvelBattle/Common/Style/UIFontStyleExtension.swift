//
//  UIFontStyleExtension.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 12/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

fileprivate extension UIFont {
    static func lightFont(ofSize size: CGFloat) -> UIFont {
        return UIFont.init(name: "Avenir Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func font(ofSize size: CGFloat) -> UIFont {
        return UIFont.init(name: "Avenir Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func boldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont.init(name: "Avenir Heavy", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

extension UIFont {
    
    static var appHeader: UIFont {
        return .boldFont(ofSize: 18)
    }
    
    static var appBody: UIFont {
        return .font(ofSize: 14)
    }
    
    static var appButton: UIFont {
        return .font(ofSize: 14)
    }
    
    static var primaryLabel: UIFont {
        return .font(ofSize: 16)
    }
    
    static var secondaryLabel: UIFont {
        return .lightFont(ofSize: 14)
    }
}
