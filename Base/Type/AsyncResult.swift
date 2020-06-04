//
//  AsyncResult.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/06/04.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public class AsyncResult<T> {
    
    private var onResult: (T) -> Void
    
    public init(onResult: @escaping (T) -> Void) {
        self.onResult = onResult
    }
    
    public func done(result: T) {
        onResult(result)
    }
    
}
