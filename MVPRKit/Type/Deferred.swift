//
//  Deferred.swift
//  MVPRKit
//
//  Created by Josh Woomin Park on 2020/08/23.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public final class Deferred<T> {
    
    // Consider making it so that the client cannot resolve/reject a Deferred instance
    static public func resolve(_ deferred: Deferred<T>, with result: T) {
        deferred.result = result
    }
    
    // Consider making it so that the client cannot resolve/reject a Deferred instance
    static public func reject(_ deferred: Deferred<T>, with error: Error) {
        deferred.error = error
    }
    
    private let latch: DispatchGroup = .init()
    
    private var result: T? {
        didSet { latch.leave() }
    }
    private var error: Error? {
        didSet { latch.leave() }
    }
    
    // TODO: Add Timeout
    public func await() throws -> T {
        latch.wait()
        guard let result = result else { throw error! }
        return result
    }
    
    public init() {
        latch.enter()
    }
    
}

