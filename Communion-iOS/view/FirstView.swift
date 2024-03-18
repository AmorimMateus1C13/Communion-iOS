//
//  FirstView.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 06/02/24.
//

import UIKit

protocol FirstViewProtocol: AnyObject {
    func buttonAction()
}

class FirstView: UIView {
    
    weak var delegate: FirstViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

//extension FirstView: ConfigurationView {
//    func viewHierarchy() {
//        <#code#>
//    }
//    
//    func setConstrants() {
//        <#code#>
//    }
//    
//    
//}
