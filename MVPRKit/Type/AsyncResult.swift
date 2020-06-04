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

extension AsyncResult {
    
    static public func with<U>(
        _ params: U,
        on queue: DispatchQueue = .main,
        _ block: @escaping (AsyncResult<T>, U) -> Void) -> T
    {
        var result: T? = nil
        let group = DispatchGroup()
        group.enter()
        let async = AsyncResult<T> {
            result = $0
            group.leave()
        }
        
        queue.async {
            block(async, params)
        }
        
        group.wait()

        return result!
    }
    
}
