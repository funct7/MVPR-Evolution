//
//  SafeLateInit.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 22/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

@propertyWrapper
struct SafeLateInit<T> {
    var wrappedValue: T {
        get { projectedValue }
        set { projectedValue = newValue }
    }
    
    @SafeReference(value: nil)
    var projectedValue: T!
    
    init() { }
}
