//
//  BasePresenter.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

class BasePresenter<EventHandler> {
    
    let queue: DispatchQueue
    
    @SafeReference
    var handler: EventHandler?
    
    func call(_ f: @escaping (EventHandler) -> Void) {
        guard let handler = handler else { return }
        queue.async { f(handler) }
    }
    
    init(queue: DispatchQueue) {
        self.queue = queue
    }
    
}
