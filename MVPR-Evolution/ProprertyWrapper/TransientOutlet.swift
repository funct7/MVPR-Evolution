//
//  TransientOutlet.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 14/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

class TransientOutletBase<T : NSObjectProtocol> {
    
    weak var target: T?
    
}

@propertyWrapper
class TransientOutlet<T : NSObjectProtocol, View> : TransientOutletBase<T> {
    
    var wrappedValue: View! {
        get { target![keyPath: keyPath] }
        set { target![keyPath: keyPath] = newValue }
    }
    
    var projectedValue: TransientOutlet<T, View> { self }
    
    private let keyPath: ReferenceWritableKeyPath<T, View?>
    
    init(keyPath: ReferenceWritableKeyPath<T, View?>) {
        self.keyPath = keyPath
    }
    
}
