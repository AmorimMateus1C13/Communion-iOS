//
//  AlertBase.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 06/02/24.
//

import UIKit

class AlertBase {
    static func creatAlertCustoms(title: String,
                                  message: String,
                                  buttonMessage: String? = "OK",
                                  view: UIViewController) {
            let ac = UIAlertController(
                title: title, message: message, preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: buttonMessage, style: .cancel))
            view.present(ac,animated: true)
    }
}
