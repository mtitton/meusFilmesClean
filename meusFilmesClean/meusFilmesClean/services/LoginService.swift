//
//  LoginService.swift
//  meusFilmesClean
//
//  Created by Marcus Titton on 01/10/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginService {
    
    func login()
    {
        let autenticacao = Auth.auth()
        autenticacao.signIn(withEmail: "teste@capgemini.com", password: "123456") { (usuario, erro) in
            //Verifica se não deu nenhum erro
            if erro == nil {
                //Verifica se o usuario foi encontrado
                if usuario == nil {
                    print("Usuario não encontrado")
                    //self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Usuario não encontrado")
                }
                else
                {
                    //Redireciona o usuario para a tela principal (pós login)
                    print("Usuario com sucesso")
                    //self.performSegue(withIdentifier: "segueLogin", sender: nil)
                }
            }
            else{
                print("Problema ao realizar autenticação")
                //self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Problema ao realizar a autenticação")
            }
        }
    }
}
