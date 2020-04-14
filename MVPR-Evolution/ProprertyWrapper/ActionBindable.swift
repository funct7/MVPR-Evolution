//
//  ActionBindable.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 14/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

protocol TargetSettable : class {
    var target: Any? { get set }
}

@propertyWrapper
class ActionBindable<Button: UIControl> : TargetSettable {
    
    var target: Any? {
        didSet { setTargetAction() }
    }
    
    weak var wrappedValue: Button! {
        didSet { setTargetAction() }
    }
    
    private let action: Selector
    private let event: UIControl.Event
    
    init(action: Selector, event: UIControl.Event = .touchUpInside) {
        self.action = action
        self.event = event
    }
    
    private func setTargetAction() {
        guard target != nil && wrappedValue != nil else { return }
        wrappedValue.addTarget(target, action: action, for: event)
    }
    
}
