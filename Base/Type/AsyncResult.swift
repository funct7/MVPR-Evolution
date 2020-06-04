//
//  AsyncResult.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/06/04.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

class AsyncResult<T> {
    
    private var onResult: (T) -> Void
    
    init(onResult: @escaping (T) -> Void) {
        self.onResult = onResult
    }
    
    func done(result: T) {
        onResult(result)
    }
    
}
