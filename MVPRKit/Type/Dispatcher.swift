//
//  Dispatcher.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/06/04.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public struct Dispatcher {
    
    public let worker: DispatchQueue
    public let ui = DispatchQueue.main
    
    public func run(_ block: @escaping () -> Void) {
        worker.async { block() }
    }
    
    public func run<T>(with input: T, _ block: @escaping (T) -> Void) {
        run { block(input) }
    }
    
    public func only(_ block: @escaping () -> Void) {
        worker.async(flags: .barrier) { block() }
    }
    
    public func only<T>(with input: T, _ block: @escaping (T) -> Void) {
        only { block(input) }
    }
    
    @discardableResult
    public func run<T, U>(
        with input: T,
        _ block: @escaping (T, AsyncResult<U>) -> Void)
        -> U
    {
        return _runWaiting(input: input, queue: worker, block: block)
    }
    
    public func ui(_ block: @escaping () -> Void) {
        ui.async { block() }
    }
    
    public func ui<T>(with input: T, _ block: @escaping (T) -> Void) {
        ui { block(input) }
    }
    
    @discardableResult
    public func ui<T, U>(
        with input: T,
        _ block: @escaping (T, AsyncResult<U>) -> Void)
        -> U
    {
        return _runWaiting(input: input, queue: ui, block: block)
    }
}

private extension Dispatcher {
    
    func _runWaiting<T, U>(
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
