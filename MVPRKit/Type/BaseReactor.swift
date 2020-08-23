//
//  BaseReactor.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/06/04.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public protocol BaseReactorType : class {
    
    var dispatcher: Dispatcher { get }
    
}

public extension BaseReactorType {
    
    func call(_ block: @escaping (Self) -> Void) {
        dispatcher.run { block(self) }
    }
    
}

open class BaseReactor : BaseReactorType {
    
    public let dispatcher: Dispatcher
    
    public init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
    }
    
}
