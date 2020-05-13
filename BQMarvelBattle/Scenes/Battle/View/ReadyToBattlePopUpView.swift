//
//  ReadyToBattlePopUpView.swift
//  BQMarvelBattle
//
//  Created by Tarsha De Souza on 13/05/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

public protocol PopUpDelegate {
    func userDidTapGoOutButton()
    func userDidTapGoToButton()
}

class ReadyToBattlePopUpView: UIView {

    public var delegate : PopUpDelegate?
    
    @IBOutlet weak var thumbnail: UIImageView! {
        didSet {
            thumbnail.image = UIImage(named: "marvel_logo")
        }
    }
    
    @IBOutlet weak var readyToBattleLabel: UILabel! {
        didSet {
            readyToBattleLabel.font = .appBody
            readyToBattleLabel.textColor = .appPrimary
        }
    }
    
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            closeButton.tintColor = .appAccent
        }
    }
    
    @IBOutlet weak var readyToBattleButton: RoundButton! {
        didSet {
            readyToBattleButton.titleLabel?.font = .appButton
            readyToBattleButton.setTitleColor(.white, for: .normal)
            readyToBattleButton.backgroundColor = .appAccent
        }
    }
    
    @IBOutlet weak var popUpContainer: UIView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        popUpContainer.layer.cornerRadius = 5
        popUpContainer.clipsToBounds = true
    }
    
    public func configurePopUp(with image: String? = nil, text: String, buttonText: String) {
        readyToBattleLabel.text = text
        readyToBattleButton.setTitle(buttonText, for: .normal)

        if let chosenImage = image {
            thumbnail.download(image: chosenImage)
        }
    }
    
    @IBAction func readyForBattlePressed(_ sender: UIButton) {
        delegate?.userDidTapGoToButton()
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        delegate?.userDidTapGoOutButton()
        self.removeFromSuperview()
    }
    
}
