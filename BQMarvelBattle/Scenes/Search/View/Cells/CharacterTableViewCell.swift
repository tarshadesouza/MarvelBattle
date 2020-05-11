//
//  CharacterTableViewCell.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 10/5/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

enum CharacterInfoType {
    case name
    case series
    case stories
    case comics
    case events
}

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterInfoStackView: UIStackView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterInfoStackView.clearSubviews()
    }
    
    func setUp(characterData: Character) {
        addContentView(stackData: characterData)
    }

    private func addContentView(stackData: Character) {
//        switch stackData.sectionType {
//            
//        case .name:
//            characterInfoStackView.addArrangedSubview(setUpLabel(with: stackData.name, cellData: stackData))
//        case .series:
//            characterInfoStackView.addArrangedSubview(setUpStackSection(with: stackData)!)
//        case .stories:
//            characterInfoStackView.addArrangedSubview(setUpStackSection(with: stackData)!)
//        case .comics:
//            characterInfoStackView.addArrangedSubview(setUpStackSection(with: stackData)!)
//        case .events:
//            characterInfoStackView.addArrangedSubview(setUpStackSection(with: stackData)!)
//
//        @unknown default:
//            return
//        }
    }
    
    private func setUpLabel(with title: String, cellData: Character) -> UILabel {
        let titleLabel = GenericInfoLabel()
        titleLabel.setup(title: title, parentView: characterInfoStackView, cellData: cellData, delegate: nil)
        return titleLabel
    }
    
    // add stack view for each sections
//    private func setUpStackSection(with cellData: Character) -> UIStackView? {
//        let sectionStackView = UIStackView()
//        switch cellData.sectionType {
//
//        case .name:
//            return nil
//        case .series:
//            cellData.series.forEach { serie in
//                sectionStackView.addArrangedSubview(setUpLabel(with: serie, cellData: cellData))
//            }
//        case .stories:
//            cellData.stories.forEach { story in
//                sectionStackView.addArrangedSubview(setUpLabel(with: story, cellData: cellData))
//            }
//        case .comics:
//            cellData.comics.forEach { comic in
//                sectionStackView.addArrangedSubview(setUpLabel(with: comic, cellData: cellData))
//            }
//        case .events:
//            cellData.events.forEach { event in
//                sectionStackView.addArrangedSubview(setUpLabel(with: event, cellData: cellData))
//            }
//        @unknown default:
//            return nil
//        }
//        return sectionStackView
//    }
}
