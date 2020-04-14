//
//  CallbackBindable.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 14/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

protocol QueueRunnable : class {
    
    var queue: DispatchQueue! { get set }
    
}

class CallbackBindableBase<T> : QueueRunnable {
    
    var queue: DispatchQueue!
    
    @SafeReference(value: nil)
    var scope: T?
    
}

@propertyWrapper
class CallbackBindable<T, Button : UIControl> : CallbackBindableBase<T> {
    
    typealias Callback = (T) -> Void
    
    var wrappedValue: Button! {
        didSet {
            wrappedValue.addTarget(
                self,
                action: #selector(action),
                for: .touchUpInside)
        }
    }
    
    var projectedValue: CallbackBindable<T, Button>  { self }
    
    private let keyPath: ReferenceWritableKeyPath<T, Callback?>
    
    init(keyPath: ReferenceWritableKeyPath<T, Callback?>) {
        self.keyPath = keyPath
    }
    
    @objc
    private func action() {
        queue.async { [scope, keyPath] in scope?[keyPath: keyPath]?(scope!) }
    }
    
}
