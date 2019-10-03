//
//  LoginService.swift
//  meusFilmesClean
//
//  Created by Marcus Titton on 01/10/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import FirebaseAuth
import UIKit

class LoginService: LoginProtocol {
    func login(_ login: String, password: String, completionHandler: @escaping (UserModel?) -> Void) {
        let autenticacao = Auth.auth()
        autenticacao.signIn(withEmail: login, password: password) { (usuario, erro) in
            //Verifica se não deu nenhum erro
            if erro == nil {
                //Verifica se o usuario foi encontrado
                if usuario == nil {
                    let retorno = UserModel.init(userId: "", email: "", message: "Usuário não encontrado, por favor, tente novamente.")
                    
                    //Retorna o conteudo
                    completionHandler(retorno)
                }
                else
                {
                    let retorno = UserModel.init(userId: (usuario?.user.uid)!, email: (usuario?.user.email)!, message: "Sucesso!")
                    
                    //Retorna o conteudo
                    completionHandler(retorno)
                }
            }
            else{
                let retorno = UserModel.init(userId: "", email: "", message: "Usuário ou senha inválido, por favor, tente novamente.")
                
                //Retorna o conteudo
                completionHandler(retorno)
            }
        }
    }
}
