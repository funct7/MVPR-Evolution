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
    
    public func exclusive(_ block: @escaping () -> Void) {
        worker.async(flags: .barrier) { block() }
    }
    
    public func exclusive<T>(with input: T, _ block: @escaping (T) -> Void) {
        exclusive { block(input) }
    }
    
    public func ui(_ block: @escaping () -> Void) {
        ui.async { block() }
    }
    
    public func ui<T>(with input: T, _ block: @escaping (T) -> Void) {
        ui { block(input) }
    }

    public init(worker: DispatchQueue) {
        self.worker = worker
    }

}
