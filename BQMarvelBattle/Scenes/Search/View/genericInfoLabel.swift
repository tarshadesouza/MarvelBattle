//
//  genericInfoLabel.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 10/5/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import UIKit

class GenericInfoLabel: UILabel {
    
    var delegate: Any?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        textColor = .blue
        font = .systemFont(ofSize: 14)
    }
    
    func setup(title: String, parentView: UIView, cellData: Character, delegate: Any?) {
        self.delegate = delegate
        text = title
        configureConstraints(parentView: parentView)
        configureGestureRecognizer(with: cellData)
    }
    
    func configureConstraints(parentView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: parentView.frame.width).isActive = true
        heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
    
    func configureGestureRecognizer(with actionType: Character) {
        let tapGesture = CustomTapGestureRecognizer(target: self,
                                                    action: #selector(didTapLabel(sender:)))
//        tapGesture.actionType = actionType.
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGesture)
    }
    
    @objc func didTapLabel(sender: CustomTapGestureRecognizer) {
        switch sender.actionType {
        case .name:
            return
        case .comics:
            return
        case .events:
            return
        case .stories:
            return
        case .series:
            return
        case .none:
            return
        }
    }
}

class CustomTapGestureRecognizer: UITapGestureRecognizer {
    var actionType: CharacterInfoType?
}
