//
//  BindableExtension.swift
//  Communion-iOS
//
//  Created by Mateus Amorim on 06/02/24.
//

import Foundation

class BindableExtension<T> {
    typealias BindType = ((T) -> Void)
    
    private var binds: [BindType] = []
    // valor dinamido inicial
    var value: T {
        didSet {
            execBinds()
        }
    }
    
    init(_ val: T) {
        value = val
    }
    
    // skip: Deve ignorar a chamada de encerramento do init
    // bind: closure para executar valor de tempo alterado
    func bind(skip: Bool = false, _ bind:@escaping BindType) {
        if skip {
            return
        }
        bind(value)
    }
    
    private func execBinds() {
        binds.forEach { [unowned self] bind in
            bind(self.value)
        }
    }
}
