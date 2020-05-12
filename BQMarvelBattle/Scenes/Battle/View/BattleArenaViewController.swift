//
//  BattleArenaViewController.swift
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

protocol BattleArenaDisplayLogic: class {
    func displaySomething(viewModel: BattleArena.Something.ViewModel)
}

class BattleArenaViewController: UIViewController, BattleArenaDisplayLogic {
    
    @IBOutlet weak var battleArenaContainer: UIView! {
        didSet {
            battleArenaContainer.backgroundColor = .appPrimaryDark
        }
    }
        
    @IBOutlet weak var firstOpponentView: UIImageView! {
        didSet {
            firstOpponentView.makeRounded()
        }
    }
    
    @IBOutlet weak var secondOpponentView: UIImageView! {
        didSet {
            secondOpponentView.makeRounded()
        }
    }
    
    @IBOutlet weak var battleButton: UIButton!
    @IBOutlet weak var dashedLine: DashedLineView!

    var interactor: BattleArenaBusinessLogic?
    var router: (NSObjectProtocol & BattleArenaRoutingLogic & BattleArenaDataPassing)?
    var fighters: [Character]?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        let viewController = self
        let interactor = BattleArenaInteractor()
        let presenter = BattleArenaPresenter()
        let router = BattleArenaRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        doSomething()
    }
    
    func doSomething() {
        let request = BattleArena.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: BattleArena.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
    
    func setUpNavBar() {
        self.setTitle("Choose Your Fighters")
    }
    @IBAction func battleButtonPressed(_ sender: UIButton) {
      
        guard let validFighters = fighters else {
            self.router?.routeToSearchController()
            return
        }
        
        print("FIGHT IS VALID WE GOT TWO FIGHTERS!!!", validFighters.count)
        
    }
    
}
extension BattleArenaViewController {
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.

        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }
}
