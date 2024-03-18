//
//  LoginView.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 27/02/24.
//

import UIKit

class LoginView: UIView {
    
    lazy var loginCard: LoginCard = {
        let view = LoginCard()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfiguration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension LoginView: ConfigurationView {
    func viewHierarchy() {
        addSubview(loginCard)
    }
    
    func setConstrants() {
        loginCard.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loginCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        loginCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        loginCard.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    
}
