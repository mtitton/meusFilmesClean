//
//  LoginPresenter.swift
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

protocol LoginPresentationLogic
{
    func presentMeusFilmes(response: Login.User.Response)
}

class LoginPresenter: LoginPresentationLogic
{
    weak var viewController: LoginDisplayLogic?
    
    func presentMeusFilmes(response: Login.User.Response) {
        viewController?.displayMeusFilmes(response: response)
    }
}
