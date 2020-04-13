//
//  SafeReference.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

@propertyWrapper
struct SafeReference<T> {
    
    var wrappedValue: T? {
        get {
            if let object = _object as? T { return object }
            return _value
        }
        set {
            if let newValue = newValue {
                if Mirror(reflecting: newValue).displayStyle == .class {
                    self._object = newValue as AnyObject
                } else {
                    self._value = newValue
                }
            } else {
                self._object = nil
                self._value = nil
            }
        }
    }
    
    private weak var _object: AnyObject?
    private var _value: T?
    
}
