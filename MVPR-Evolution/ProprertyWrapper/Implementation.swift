//
//  Implementation.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 22/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

@propertyWrapper
struct Implementation<T, P> {
    
    var wrappedValue: P { projectedValue as! P }
    
    var projectedValue: T
    
    init(_ instance: T) {
        self.projectedValue = instance
    }
    
}
