//
//  ButtonExtension.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 08/03/24.
//

import UIKit

extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineColor,
            value: self.titleColor(for: .normal),
            range: NSRange(location: 0, length: text.count))
        
        attributedString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: self.titleColor(for: .normal),
            range: NSRange(location: 0, length: text.count))
        
        attributedString.addAttribute(
            NSAttributedString.Key.underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
