//
//  StackViewExtension.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 10/5/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

extension UIStackView {
    
    @discardableResult
    func addArrangedView(_ view: UIView, width: CGFloat, height: CGFloat) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: height)
        heightConstraint.isActive = true
        
        let widthConstraint = view.widthAnchor.constraint(equalToConstant: width)
        widthConstraint.isActive = true
        
        self.addArrangedSubview(view)
        
        return (widthConstraint, heightConstraint)
    }
    
    func getViewIndex(_ view: UIView) -> Int? {
        return self.arrangedSubviews.firstIndex(of: view)
    }
    
    func clearSubviews() {
        _ = subviews.map({ subview in
            self.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        })
    }
}
