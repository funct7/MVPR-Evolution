//
//  BasePresenter.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

class BasePresenter<EventHandler> : Dispatchable {
    
    @LateInit
    var queue: DispatchQueue
    
    @SafeReference(value: nil)
    var handler: EventHandler?
    
    func call(_ f: @escaping (EventHandler) -> Void) {
        guard let handler = handler else { return }
        queue.async { f(handler) }
    }
    
    init(queue: DispatchQueue? = nil) {
        if let queue = queue { self.queue = queue }
        
        Mirror(reflecting: self).children.forEach {
            ($0.value as? TargetSettable)?.target = self
        }
    }
    
}

protocol Dispatchable : class {
    
    var queue: DispatchQueue { get set }
    
}
