//
//  UpperBoundWrappingInt.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

/**
 숫자가 정해진 범위를 넘어가면 0으로 리셋.
 */
@propertyWrapper
struct UpperBoundWrappingInt {
    
    private let upperBound: Int
    private var value: Int
    
    var wrappedValue: Int {
        get { value }
        set { value = newValue > upperBound ? 0 : newValue }
    }
    
    init(value: Int, upperBound: Int) {
        self.value = value
        self.upperBound = upperBound
    }
    
}
