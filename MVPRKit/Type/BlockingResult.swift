//
//  BlockingResult.swift
//  MVPRKit
//
//  Created by Josh Woomin Park on 2020/06/11.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public final class BlockingResult<T> {
    
    private var result: T!
    private var error: Error!
    private let queue = DispatchQueue(label: "future")
    private let group = DispatchGroup()

    public func resolve(_ result: T) {
        guard self.result == nil else { return }
        queue.async {
            self.result = result
            self.group.leave()
        }
    }
    
    public func reject(_ error: Error) {
        guard self.error == nil else { return }
        queue.async {
            self.error = error
            self.group.leave()
        }
    }
    
    public func wait() throws -> T {
        group.wait()
        
        if let error = error { throw error }
        
        return result
    }
    
    public init() {
        group.enter()
    }

}
