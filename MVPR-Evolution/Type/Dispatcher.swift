//
//  Dispatcher.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/06/04.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

struct Dispatcher {
    
    let worker: DispatchQueue
    let ui = DispatchQueue.main
    
    func run(_ block: @escaping () -> Void) {
        worker.async { block() }
    }
    
    func run<T>(with input: T, _ block: @escaping (T) -> Void) {
        run { block(input) }
    }
    
    @discardableResult
    func run<T, U>(
        with input: T,
        _ block: @escaping (T, AsyncResult<U>) -> Void)
        -> U
    {
        return _runBlocking(input: input, queue: worker, block: block)
    }
    
    func ui(_ block: @escaping () -> Void) {
        ui.async { block() }
    }
    
    func ui<T>(with input: T, _ block: @escaping (T) -> Void) {
        ui { block(input) }
    }
    
    @discardableResult
    func ui<T, U>(
        with input: T,
        _ block: @escaping (T, AsyncResult<U>) -> Void)
        -> U
    {
        return _runBlocking(input: input, queue: ui, block: block)
    }
}

private extension Dispatcher {
    
    func _runBlocking<T, U>(
        input: T,
        queue: DispatchQueue,
        block: @escaping (T, AsyncResult<U>) -> Void)
        -> U
    {
        let group = DispatchGroup()
        var result: U?
        let async = AsyncResult { (input: U) in
            result = input
            group.leave()
        }
        
        group.enter()
        queue.async { block(input, async) }
        group.wait()
        
        return result!
    }
    
}
