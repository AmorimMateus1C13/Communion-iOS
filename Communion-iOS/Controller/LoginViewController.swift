//
//  LoginViewController.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 27/02/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var boolValue: UserDefaults?


    var loginView: LoginView = {
        let view = LoginView()
        view.backgroundColor = Colors.secondBackGround
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfiguration()
        selfDelegates()
    }
    
    func selfDelegates() {
        loginView.loginCard.loginInput.delegate = self
        loginView.loginCard.passwordInput.delegate = self
        loginView.loginCard.delegate = self
    }
    
}

extension LoginViewController: ConfigurationView {
    func viewHierarchy() {
        view.addSubview(loginView)
    }
    
    func setConstrants() {
        [
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].activate()
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.clearInvalidFieldDetected(objc: textField)
        loginView.loginCard.alertConfig(isHidden: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == loginView.loginCard.loginInput {
            loginView.loginCard.passwordInput.becomeFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loginView.loginCard.loginInput.resignFirstResponder()
        loginView.loginCard.passwordInput.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return textField.limitChar(objc: loginView.loginCard.passwordInput, charSet: .eight, replace: string)
    }
    
}

extension LoginViewController: LoginCardProtocol {
    func remeberMeButtonAction(remember: Bool) {
//        UserDefaults.standard.set(remember, forKey: "remember")
    }
    
    func forgottenButtonAction() {}
    
    func nextButtonAction() {}
    
    func registerButtonAction() {}
    
}
