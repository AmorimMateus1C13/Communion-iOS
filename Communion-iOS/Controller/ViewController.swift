//
//  ViewController.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 06/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    var firstView: FirstView = {
        let view = FirstView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfiguration()
    }
}

extension ViewController: ConfigurationView {
    func viewHierarchy() {
        view.addSubview(firstView)
    }
    
    func setConstrants() {
        [
            firstView.topAnchor.constraint(equalTo: view.topAnchor),
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].activate()
    }
    
    
}
