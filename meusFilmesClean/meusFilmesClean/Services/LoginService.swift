//
//  LoginService.swift
//  meusFilmesClean
//
//  Created by Marcus Titton on 01/10/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import FirebaseAuth

class LoginService: LoginProtocol {
    func login(_ login: String, password: String, completionHandler: @escaping (UserModel?) -> Void) {
        let autenticacao = Auth.auth()
        autenticacao.signIn(withEmail: login, password: password) { (usuario, erro) in
            //Verifica se não deu nenhum erro
            if erro == nil {
                //Verifica se o usuario foi encontrado
                if usuario == nil {
                    //alert(message: "Usuário não encontrado", title: "Atenção")
                }
                else
                {
                    //Redireciona o usuario para a tela principal (pós login)
                    //usuario?.user.displayName
                    let usuario = usuario?.user
                    print(usuario)
                    //self.performSegue(withIdentifier: "segueLogin", sender: nil)
                }
            }
            else{
                //self.alert(message: "Problema ao realizar a autenticação", title: "Atenção")
                //self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Problema ao realizar a autenticação")
            }
        }
    }
}
