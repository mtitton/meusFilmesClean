//
//  LoginInteractor.swift
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

protocol LoginBusinessLogic
{
    func doSomething(request: Login.Something.Request)
    func doLogin(request: Login.User.Request)
}

protocol LoginDataStore
{
    var user: UserModel! { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var user: UserModel!
  
    // MARK: Do something
    func doSomething(request: Login.Something.Request)
    {
//        worker = LoginWorker(<#LoginProtocol#>)
//        worker?.doSomeWork()
//
//        let response = Login.Something.Response()
//        presenter?.presentSomething(response: response)
    }
    
    func doLogin(request: Login.User.Request) {
        worker = LoginWorker(LoginService())
        worker?.login(request.user, password: request.password) { (response: UserModel?) in
            //Atribui o retorno na variavel que foi definida fora (com base no model)
            self.user = response
            
            //Chama a função de salvar o ultimo usuario logado
            //self.saveUser(request: request)
        }
        
    }
}