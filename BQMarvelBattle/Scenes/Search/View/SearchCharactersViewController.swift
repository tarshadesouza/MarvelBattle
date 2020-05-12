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
}

protocol SearchCharactersDisplayLogic: class {
    func displayData(viewModel: SearchCharacters.Model.ViewModel)
}

class SearchCharactersViewController: UIViewController, SearchCharactersDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
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
    
    var tableDatasource: SearchCharacterDatasource?
    var tableDelegate: SearchCharacterTableDelegate?
    var interactor: SearchCharactersBusinessLogic?
    var router: (NSObjectProtocol & SearchCharactersRoutingLogic & SearchCharactersDataPassing)?
    var characters: [Character]?
    
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
        tableDelegate = SearchCharacterTableDelegate(self)
        tableDatasource = SearchCharacterDatasource(items: items, tableView: self.tableView, delegate: tableDelegate!)
    }
    
    private func setUpUI() {
        searchBar.delegate = self
        self.view.backgroundColor = .appPrimaryDark
    }
    
    func setupNavigationBar() {
        
        let rankingButton = UIBarButtonItem(image: UIImage(named: "ic_trophy"),
                                            style: .done,
                                            target: self,
                                            action: #selector(SearchCharactersViewController.goToBattleArena))
        
        let battleArenaButton = UIBarButtonItem(image: UIImage(named: "ic_trophy"),
                                                style: .done,
                                                target: self,
                                                action: #selector(SearchCharactersViewController.goToBattleArena))
        rankingButton.tintColor = .systemRed
        battleArenaButton.tintColor = .systemBlue
        self.setRightButton([rankingButton,battleArenaButton])
        self.setTitle("Character Search")
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    @objc func goToBattleArena() {
        //        self.router?.popViewController(self)
    }
    
    func displayData(viewModel: SearchCharacters.Model.ViewModel) {
        guard let characters = viewModel.characters else {
            return
        }
        setupTableView(with: characters)
        tableView.reloadData()
    }
}

extension SearchCharactersViewController {
    //Interaction
    func searchForCharacters(with name: String) {
        let request = SearchCharacters.Model.Request(characterName: name)
        interactor?.searchCharacterNames(request: request)
    }
}

//MARK: Tableview Delegate methods
extension SearchCharactersViewController: SearchCharactersDelegate {
    
    func didSelectCharacter(at index: IndexPath) {
        searchBar.resignFirstResponder()
        guard let character = characters?[index.row] else {
        // TODO: Error handling
            return
        }
        
        self.router?.showCharacterDetail(with: character)
    }
}

extension SearchCharactersViewController: UISearchBarDelegate {
    
    //MARK: SearchBar Delegates
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keySearch = searchBar.text else {return}
        searchBar.endEditing(true)
        searchForCharacters(with: keySearch)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
