//
//  ImageViewExtension.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 08/03/24.
//

import UIKit

extension UIImageView {
    
    func changeBySFSymbol(symbol: SFSimbolEnum) {
        self.image = UIImage(systemName: symbol.rawValue)
    }
    
    func changeByAssets(imageName: String, someClass: AnyClass) {
                let bundle = Bundle(for: someClass.self)
                if let image = UIImage(named: imageName, in:  bundle, compatibleWith: nil) {
                    self.image = image
                    self.contentMode = .scaleAspectFit
                }
    }
}
