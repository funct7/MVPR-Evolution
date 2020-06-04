//
//  BaseReactor.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/06/04.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

protocol BaseReactorType : class {
    
    var dispatcher: Dispatcher { get }
    
}

extension BaseReactorType {
    
    func call(_ block: @escaping (Self) -> Void) {
        dispatcher.run { block(self) }
    }
    
}

class BaseReactor : BaseReactorType {
    
    let dispatcher = Dispatcher(worker: .global(qos: .userInteractive))
    
}
