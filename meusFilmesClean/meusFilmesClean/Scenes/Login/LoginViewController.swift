//
//  LoginViewController.swift
//  meusFilmesClean
//
//  Created by Marcus Titton on 01/10/19.
//  Copyright (c) 2019 Marcus Titton. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginDisplayLogic: class
{
    func displaySomething(viewModel: Login.Something.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_senha: UITextField!

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
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
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
        //doSomething()
    }
  
    // MARK: Do something
    func doSomething()
    {
        let request = Login.Something.Request()
        interactor?.doSomething(request: request)
    }
  
    func displaySomething(viewModel: Login.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
    
    @IBAction func btn_Login(_ sender: Any)
    {
        //Faz as validações se os campos de login foram preenchidos
        let email = txt_email.text
        let senha = txt_senha.text
        
        if !email!.isEmpty || !senha!.isEmpty
        {
            //Os campos estão preenchidos, manda para o interactor fazer o trabalho da request
            let request = Login.User.Request(user: email!, password: senha!)
            interactor?.doLogin(request: request)
        }
        else
        {
            alert(message: "Os campos de e-mail e senha devem estar preenchidos.", title: "Atenção")
        }
    }
}