//
//  Implementation.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 22/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

/**
 - Invariant: `T : P`
 */
@propertyWrapper
struct Implementation<T, P> {
    
    var wrappedValue: P
    
    var projectedValue: T { wrappedValue as! T }
    
    init(_ instance: T) {
        self.wrappedValue = instance as! P
    }
    
}
