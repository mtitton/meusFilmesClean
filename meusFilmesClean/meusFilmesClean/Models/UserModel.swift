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
    var userId: Int
    var name: String
    
    init(userId: Int, name: String) {
        self.userId = userId
        self.name = name
    }
}
