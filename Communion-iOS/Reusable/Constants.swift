//
//  Constants.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 08/03/24.
//

import Foundation

struct Constants {
    static let loginLabel = "Login"
    static let passwordLabel = "Senha"
    static let loginTitleButton = "Entrar"
    static let loginRegisterButton = "Criar uma conta"
    static let checkBoxLabel = "Lembrar de mim"
    static let forgottenTitleButton = "Esqueceu a senha?"
    static let userDefaults = UserDefaultsStatic.self
    static let alertEmptyFields = "Os campos devem ser preenchidos"
}

struct UserDefaultsStatic {
    static let rememberMe = "rememberMe"
    static let login = "userLogin"
    static let password = "password"
}


