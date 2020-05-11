//
//  MainNavBar.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 9/5/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import UIKit

//Navigation Bar
 public extension UIViewController {
    func configureNavigationBar(title: String? = nil, leftButton: UIBarButtonItem? = nil, rightButton: [UIBarButtonItem]? = nil) {
        setNavigationBar()
        setTitle(title)
        setLeftButton(leftButton)
        setRightButton(rightButton)
    }
    
    func setTitle(_ title: String?) {
        guard let title = title else {
            return
        }
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.textColor = .red
        titleLabel.text = title
        navigationItem.titleView = titleLabel
    }
    
    func setLeftButton(_ leftButton: UIBarButtonItem?) {
        if let leftButton = leftButton {
            leftButton.customView?.sizeToFit()
            navigationItem.leftBarButtonItem = leftButton
        }
    }

    func setRightButton(_ rightButtons: [UIBarButtonItem]?) {
        if let rightButton = rightButtons {
            navigationItem.rightBarButtonItems = rightButton
        } else {
            navigationItem.rightBarButtonItems = nil
        }
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        // Remove line
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }
}
