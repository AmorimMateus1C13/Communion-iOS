//
//  LayoutExtension.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 06/02/24.
//

import UIKit

extension Collection where Self.Element == NSLayoutConstraint {
    func activate() {
        forEach{ $0.isActive = true }
    }
}
