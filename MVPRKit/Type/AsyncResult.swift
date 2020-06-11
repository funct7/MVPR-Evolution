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
    
    /**
     호출하는 스레드에서는 대기를 하면서 결과를 받음.
     
     - Parameters:
        - input: `block`의 입력값.
        - queue: `block` task를 추가할 queue.
        - block: 실행할 코드.
     */
    static public func get<U>(
        input: U,
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
            block(async, input)
        }
        
        group.wait()

        return result!
    }
    
}
