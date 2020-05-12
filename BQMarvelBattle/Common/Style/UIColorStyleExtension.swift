//
//  UIColorStyleExtension.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 12/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

fileprivate extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int, opacity: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(opacity >= 0 && opacity <= 1, "Invalid alpha component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: opacity)
    }
    
    convenience init(hex: Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
    
    convenience init(hex: Int, alpha: CGFloat) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff, opacity: alpha)
    }
}

extension UIColor {
    static var appPrimary: UIColor {
        return UIColor(hex: 0x1f4068)
    }
    
    static var appPrimaryDark: UIColor {
        return UIColor(hex: 0x162447)
    }
    
    static var appPrimaryDarkest: UIColor {
        return UIColor(hex: 0x1b1b2f)
    }
    
    static var appAccent: UIColor {
        return UIColor(hex: 0xe43f5a)
    }
    static var characterCellLabel: UIColor {
        return UIColor.white
    }
    
}
