//
//  SearchCharactersViewController.swift
//  BQMarvelBattle
//
//  Created by Tarsha de Souza on 9/5/20.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchCharactersDelegate {
    func didSelectCharacter(at index: IndexPath)
    func didDeSelectCharacter(at index: IndexPath)
}

protocol SearchCharactersDisplayLogic: class {
    func displayData(viewModel: SearchCharacters.Model.ViewModel)
    func showError(error: AppError)
}

class SearchCharactersViewController: UIViewController, SearchCharactersDisplayLogic {
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.tintColor = .appPrimaryDark
            searchBar.barTintColor = .appAccent
            
            let textField = searchBar.value(forKey: "searchField") as! UITextField
            
            let glassIconView = textField.leftView as! UIImageView
            glassIconView.image = glassIconView.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            glassIconView.tintColor = UIColor.white
            
            textField.font = .appBody
            textField.textColor = .characterCellLabel
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableDatasource: SearchCharacterDatasource?
    var tableDelegate: SearchCharacterTableDelegate?
    var interactor: SearchCharactersBusinessLogic?
    var router: (NSObjectProtocol & SearchCharactersRoutingLogic & SearchCharactersDataPassing)?
    var characters: [Character]?
    var battleArray = [Character]()
    
    var isBattle = false {
        didSet {
            tableDelegate?.isBattle = isBattle
        }
    }
    
    var isEditingFighterList = false {
        didSet {
            if isEditingFighterList {
            }
        }
    }
    
    var numberOfFighters: Int = 0 {
        didSet{
            if numberOfFighters == 2 {
                numberOfFighters = 0
                self.router?.presentBattlePopUp()
            }
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setUpUI()
        interactor?.searchAllCharacters()
        setupTableView(with: characters)
        tableView.reloadData()
    }
    
    private func setup() {
        let viewController = self
        let interactor = SearchCharactersInteractor()
        let presenter = SearchCharactersPresenter()
        let router = SearchCharactersRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func setupTableView(with items: [Character]?) {
        self.characters = items
        tableDelegate = SearchCharacterTableDelegate(self, isBattle: isBattle)
        tableDatasource = SearchCharacterDatasource(items: items, tableView: self.tableView, delegate: tableDelegate!)
        tableView.allowsMultipleSelection = true
    }
    
    private func setUpUI() {
        searchBar.delegate = self
        self.view.backgroundColor = .appPrimaryDark
    }
    
    func setupNavigationBar() {
        
        let rankingButton = UIBarButtonItem(image: UIImage(named: "ic_trophy"),
                                            style: .done,
                                            target: self,
                                            action: #selector(SearchCharactersViewController.goToRankings))
        
        let battleArenaButton = UIBarButtonItem(image: UIImage(named: "ic_arena"),
                                                style: .done,
                                                target: self,
                                                action: #selector(SearchCharactersViewController.goToBattleArena))
        rankingButton.tintColor = .systemRed
        battleArenaButton.tintColor = .systemBlue
        self.setRightButton([rankingButton,battleArenaButton])
        self.setTitle("Character Search")
    }
    
    @objc func goToBattleArena() {
        self.router?.goToBattleArena()
    }
    
    @objc func goToRankings() {
        self.router?.goToRankings()
    }
    
    func displayData(viewModel: SearchCharacters.Model.ViewModel) {
        guard let characters = viewModel.characters else {
            return
        }
        setupTableView(with: characters)
        tableView.reloadData()
        battleArray = [Character]()
    }
    
    func isReadyToBattle() -> Bool {
        if isEditingFighterList {
            return true
        }
        return false
    }
    
    func showError(error: AppError) {
        self.presentAlert(withTitle: error.title, message: error.description)
    }
}

extension SearchCharactersViewController {
    func searchForCharacters(with name: String) {
        let request = SearchCharacters.Model.Request(characterName: name)
        interactor?.searchCharacterNames(request: request)
    }
}
