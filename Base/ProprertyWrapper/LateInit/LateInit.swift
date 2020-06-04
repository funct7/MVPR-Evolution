//
//  LateInit.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/06/04.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

/**
 * - Warning: 해당 property wrapper로 감싼 property의 경우 `willSet/didSet` 옵저버를 사용할 수 없음.
 * (`willSet/didSet`에 unwrapped property가 넘겨지기 때문).
 *
 * 대신 `LateInit<T>.willSet/didSet`을 사용해야 함.
 * 또한 `willSet/didSet`에 넘겨지는 값을 사용하고 직접 property에 접근해서는 안 됨.
 */
@propertyWrapper
struct LateInit<T> {
    
    var wrappedValue: T {
        get { projectedValue }
        set { projectedValue = newValue }
    }
    
    var projectedValue: T! {
        willSet { willSet?(projectedValue, newValue) }
        didSet { didSet?(oldValue, projectedValue) }
    }
    
    var willSet: ((T?, T) -> Void)?
    var didSet: ((T?, T) -> Void)?
    
    init() { }
}
