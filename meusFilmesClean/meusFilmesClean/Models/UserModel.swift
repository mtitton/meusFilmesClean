//
//  UserModel.swift
//  meusFilmesClean
//
//  Created by Marcus Titton on 03/10/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import Foundation

//Campos que voltam da API / Firebase
struct UserModel: Decodable {
    var userId: String
    var email: String
    var message: String
    
    init(userId: String = "", email: String = "", message: String = "") {
        self.userId = userId
        self.email = email
        self.message = message
    }
}
