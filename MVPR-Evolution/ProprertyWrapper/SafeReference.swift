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
            setValue(newValue)
        }
    }

    private weak var _object: AnyObject? = nil
    
    private var _value: T? = nil
    
    init(value: T? = nil) {
        setValue(value)
    }
    
}

private extension SafeReference {
    
    mutating func setValue(_ value: T?) {
        if let value = value {
            if Mirror(reflecting: value).displayStyle == .class {
                self._object = value as AnyObject
            } else {
                self._value = value
            }
        } else {
            self._object = nil
            self._value = nil
        }
    }
    
}
