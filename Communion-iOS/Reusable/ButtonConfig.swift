//
//  PrimaryButton.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 07/03/24.
//

import UIKit

class ButtonConfig: UIButton {
    
    init(buttonTheme: ButtonThemes, title: String) {
        super.init(frame: .zero)
        configure(buttonTheme: buttonTheme, title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(buttonTheme: ButtonThemes, title: String) {
        switch buttonTheme {
        case .primary:
           primaryConfig(title: title)
        case .secondary:
            secondaryConfig(title: title)
        case .underlined:
            underlineConfig(title: title)
        }
    }
    
    func primaryConfig(title: String) {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16,weight: .semibold)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = Colors.secondBackGround
        self.layer.cornerRadius = 5
    }
    
    func secondaryConfig(title: String) {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16,weight: .semibold)
        self.setTitle(title, for: .normal)
        self.setTitleColor(Colors.secondBackGround, for: .normal)
        self.backgroundColor = .white
        self.layer.borderWidth = 2
        self.layer.borderColor = Colors.secondBackGround.cgColor
        self.layer.cornerRadius = 5
    }
    
    func underlineConfig(title: String) {
        self.underline()
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
    }
    
}
