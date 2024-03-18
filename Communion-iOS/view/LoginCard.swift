//
//  LoginCard.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 07/03/24.
//

import UIKit

protocol LoginCardProtocol: AnyObject {
    func forgottenButtonAction()
    func nextButtonAction()
    func registerButtonAction()
}

class LoginCard: UIView {
    
    weak var delegate: LoginCardProtocol?
    
    lazy var checkOrUncheck: Bool = Bool() {
        didSet {
            checkBoxConfig()
        }
    }
    
    lazy private var stackVertical: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalCentering
        stack.spacing = 8
        return stack
    }()
    
    lazy private var loginLabel: UILabel = {
       let label = UILabel()
        label.text = Constants.loginLabel
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
       label.numberOfLines = 1
       label.textColor = .white
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    lazy var loginInput: UITextField = {
       let text = UITextField()
        text.font = UIFont.systemFont(ofSize: 16)
        text.textAlignment = .center
        text.backgroundColor = .white
        text.keyboardType = .emailAddress
        text.autocorrectionType = .default
        text.autocapitalizationType = .none
        text.layer.cornerRadius = 5
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy private var passwordLabel: UILabel = {
       let label = UILabel()
        label.text = Constants.passwordLabel
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
       label.numberOfLines = 1
       label.textColor = .white
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    lazy var passwordInput: UITextField = {
       let text = UITextField()
        text.font = UIFont.systemFont(ofSize: 16)
        text.textAlignment = .center
        text.backgroundColor = .white
        text.keyboardType = .emailAddress
        text.autocorrectionType = .default
        text.autocapitalizationType = .none
        text.isSecureTextEntry = true
        text.layer.cornerRadius = 5
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    
    lazy private var loginAlert: UILabel = {
       let label = UILabel()
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
   }()
    
    lazy private var stackHorizontal: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 8
        return stack
    }()
    
     lazy private var checkBoxStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        return stack
    }()
    
     lazy private var checkBoxButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(checkBoxAction), for: .touchUpInside)
        return button
    }()
    
     lazy private var checkBoxLabel: UILabel = {
        let label = UILabel()
         label.text = Constants.checkBoxLabel
         label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var forgottenButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitle(Constants.forgottenTitleButton, for: .normal)
        button.contentHorizontalAlignment = .left
        button.setTitleColor(.white, for: .normal)
        button.underline()
        button.addTarget(self, action: #selector(forgottenButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var nextButton: ButtonConfig = {
        let button = ButtonConfig(buttonTheme: .primary, title: Constants.loginTitleButton)
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    lazy private var createAccountButton: ButtonConfig = {
        let button = ButtonConfig(buttonTheme: .secondary, title: Constants.loginRegisterButton)
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfiguration()
        configuration()
        checkOrUncheck = UserDefaults.standard.bool(forKey: Constants.userDefaults.rememberMe)
        fillLogin()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func checkBoxConfig() {
        if checkOrUncheck {
            changeImageOnCheckBox(imageName: .check)
        } else {
            changeImageOnCheckBox(imageName: .uncheck)
        }
    }
    
    func copyByRemember(login: String, password: String) {
        if checkOrUncheck {
            UserDefaults.standard.setValue(login, forKey: Constants.userDefaults.login)
            UserDefaults.standard.setValue(password, forKey: Constants.userDefaults.password)
        } else {
            UserDefaults.standard.removeObject(forKey: Constants.userDefaults.login)
            UserDefaults.standard.removeObject(forKey: Constants.userDefaults.password)
        }
        
    }
    
    func fillLogin() {
        if checkOrUncheck {
            loginInput.text = UserDefaults.standard.string(forKey: Constants.userDefaults.login)
            passwordInput.text = UserDefaults.standard.string(forKey: Constants.userDefaults.password)
        }
    }
    
    @objc func checkBoxAction() {
        checkOrUncheck = !checkOrUncheck
        UserDefaults.standard.setValue(checkOrUncheck, forKey: Constants.userDefaults.rememberMe)
    }
    
    @objc func forgottenButtonPressed() {
        delegate?.forgottenButtonAction()
    }
    
    @objc func nextButtonPressed() {
        delegate?.nextButtonAction()
        guard let login = loginInput.text else { return }
        guard let password = passwordInput.text else { return }
        if login.isEmpty || password.isEmpty {
           loginInput.invalidFieldDetected()
           passwordInput.invalidFieldDetected()
            alertConfig(isHidden: false, message: Constants.alertEmptyFields)
        } else {
            copyByRemember(login: login, password: password)
        }
        
    }
    
    @objc func registerButtonPressed() {
        delegate?.registerButtonAction()
    }
    
    func alertConfig(isHidden: Bool, message: String = String()) {
        loginAlert.text = message
        loginAlert.isHidden = isHidden
    }
    
    func configuration() {
        self.backgroundColor = Colors.cardPrimary
        self.layer.cornerRadius = 25
    }
    
    func changeImageOnCheckBox(imageName: CheckBoxEnum) {
        if #available(iOS 15.0, *) {
            var config = UIImage.SymbolConfiguration(hierarchicalColor: .white)
            config = config.applying(UIImage.SymbolConfiguration(pointSize: 15))
            if let image = UIImage(systemName: imageName.rawValue,withConfiguration: config){
                checkBoxButton.setImage(image, for: .normal)
                checkBoxButton.contentMode = .scaleAspectFill
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

extension LoginCard: ConfigurationView {
    func viewHierarchy() {
        addSubview(stackVertical)
        stackVertical.addArrangedSubview(loginLabel)
        stackVertical.addArrangedSubview(loginInput)
        stackVertical.addArrangedSubview(passwordLabel)
        stackVertical.addArrangedSubview(passwordInput)
        stackVertical.addArrangedSubview(loginAlert)
//        stackVertical.addArrangedSubview(stackHorizontal)
        addSubview(stackHorizontal)
            stackHorizontal.addArrangedSubview(checkBoxStack)
                checkBoxStack.addArrangedSubview(checkBoxButton)
                checkBoxStack.addArrangedSubview(checkBoxLabel)
            stackHorizontal.addArrangedSubview(forgottenButton)
        
        addSubview(nextButton)
        addSubview(createAccountButton)
    }
    
    func setConstrants() {
        stackVertical.topAnchor.constraint(equalTo: topAnchor,constant: 16)
            .isActive = true
        stackVertical.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24)
            .isActive = true
        stackVertical.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24)
            .isActive = true
                
        loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        
        loginInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        loginInput.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24).isActive = true
        loginInput.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24).isActive = true
        
        passwordInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        passwordInput.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24).isActive = true
        passwordInput.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        stackHorizontal.topAnchor.constraint(equalTo: stackVertical.bottomAnchor, constant: 24).isActive = true
        stackHorizontal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24)
            .isActive = true
        stackHorizontal.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24)
            .isActive = true
        
        nextButton.topAnchor.constraint(equalTo: stackHorizontal.bottomAnchor, constant: 16).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        createAccountButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 8).isActive = true
        createAccountButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24).isActive = true
        createAccountButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}
