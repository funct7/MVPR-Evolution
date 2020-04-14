//
//  CallbackBindablePresenter.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 14/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

class CallbackBindablePresenter<P> {
    
    init(queue: DispatchQueue) {
        Mirror(reflecting: self).children.forEach {
            ($0.value as? QueueRunnable)?.queue = queue
            ($0.value as? CallbackBindableBase<P>)?.scope = self as? P
        }
    }
    
}
