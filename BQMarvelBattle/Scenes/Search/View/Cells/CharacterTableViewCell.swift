//
//  CharacterTableViewCell.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 12/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterName: UILabel! {
        didSet {
            characterName.font = .primaryLabel
            characterName.backgroundColor = .clear
            characterName.textColor = .characterCellLabel
        }
    }
    
    @IBOutlet weak var characterDescription: UILabel! {
        didSet {
            characterDescription.font = .secondaryLabel
            characterDescription.backgroundColor = .clear
            characterDescription.textColor = .characterCellLabel
            characterDescription.numberOfLines = 2
        }
    }
    
    @IBOutlet weak var characterImage: UIImageView! {
        didSet {
            characterImage.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = .appPrimaryDark
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    static func height() -> CGFloat {
        return 90
    }
    
    func setUp(characterData: Character) {
        characterName.text = characterData.name
        characterDescription.text = characterData.description.isEmpty ? "No description" : characterData.description
        characterImage.download(image: characterData.thumbnail?.fullPath() ?? "")
    }
}
