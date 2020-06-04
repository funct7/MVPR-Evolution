//
//  Implementation.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/06/04.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

/**
 - Invariant: `T : P`
 */
@propertyWrapper
public struct Implementation<T, P> {
    
    public var wrappedValue: P
    
    public var projectedValue: T { wrappedValue as! T }
    
    /**
     - Precondition: `T : P`
     */
    public init(_ instance: T) {
        self.wrappedValue = instance as! P
    }
    
}
