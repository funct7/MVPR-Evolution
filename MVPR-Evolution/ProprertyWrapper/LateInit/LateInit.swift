//
//  LateInit.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 22/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

@propertyWrapper
struct LateInit<T> {

    var wrappedValue: T {
        get { projectedValue }
        set { projectedValue = newValue }
    }
    var projectedValue: T!
    
    init() { }
}
