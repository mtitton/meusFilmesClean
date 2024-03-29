//
//  MeusFilmesViewController.swift
//  meusFilmesClean
//
//  Created by Marcus Titton on 03/10/19.
//  Copyright (c) 2019 Marcus Titton. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MeusFilmesDisplayLogic: class
{
    func displaySomething(viewModel: MeusFilmes.Something.ViewModel)
}

class MeusFilmesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MeusFilmesDisplayLogic
{
    var interactor: MeusFilmesBusinessLogic?
    var router: (NSObjectProtocol & MeusFilmesRoutingLogic & MeusFilmesDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = MeusFilmesInteractor()
        let presenter = MeusFilmesPresenter()
        let router = MeusFilmesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = MeusFilmes.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: MeusFilmes.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
    
    /***** TABELA *****/
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        
        //Atribui os registros encontrados da API aos campos do storyboard
//        celula.txt_titulo.text = statement.title
//        celula.txt_descricao.text = statement.desc
//        celula.txt_data.text = statement.date.formataData()
//        celula.txt_valor.text = statement.value.formataMoeda()
        
        //Retorna a celula criada
        return celula
    }
}

