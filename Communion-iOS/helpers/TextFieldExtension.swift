//
//  TextFieldExtension.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 11/03/24.
//

import UIKit

enum CharSet: Int {
    case four = 4
    case five = 5
    case eight =  8
    case twelve = 12
}

extension UITextField {
    
    func limitChar(objc: UITextField, charSet: CharSet, replace: String) -> Bool {
        if self == objc { return charSetRule(charSet: charSet, string: replace) }
        return true
    }
    
    func charSetRule(charSet: CharSet, _ range: NSRange = NSRange(), string: String) -> Bool {
        let currentString: NSString = (self.text ?? String()) as NSString
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= charSet.rawValue
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: self.text) {
            return true
        } else {
            return false
        }
    }
    
    func invalidFieldDetected() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(ciColor: .red).cgColor
    }
    
    func clearInvalidFieldDetected(objc: UITextField) {
        if self == objc {
            self.layer.borderWidth = 0
        }
    }
    
}
