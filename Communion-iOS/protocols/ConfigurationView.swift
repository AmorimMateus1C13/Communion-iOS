//
//  viewConfiguration.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 06/02/24.
//

import Foundation

protocol ConfigurationView {
    func setupConfiguration()
    func viewHierarchy()
    func setConstrants()
}

extension ConfigurationView {
    func setupConfiguration() {
        viewHierarchy()
        setConstrants()
    }
}
