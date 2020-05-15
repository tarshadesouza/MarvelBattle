//
//  CharacterDetailViewController.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 12/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var characterNameLbl: UILabel! {
        didSet {
            characterNameLbl.font = .appHeader
            characterNameLbl.textColor = .characterCellLabel
        }
    }
    
    @IBOutlet weak var characterImg: UIImageView! {
        didSet {
            characterImg.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var descriptionTextView: UITextView! {
        didSet {
            descriptionTextView.font = .appBody
            descriptionTextView.textColor = .characterCellLabel
            descriptionTextView.backgroundColor = .appPrimaryDarkest
        }
    }
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .appPrimaryDarkest
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpDetail()
    }
    
    func setUpDetail() {
        guard let characterDetail = character else {
            self.presentAlert(withTitle: AppError.resourceLoadingError.title, message: AppError.resourceLoadingError.description)
            return
        }
        characterNameLbl.text = characterDetail.name
        characterImg.download(image: characterDetail.thumbnail?.fullPath() ?? "")
        descriptionTextView.text = characterDetail.description
    }
}
