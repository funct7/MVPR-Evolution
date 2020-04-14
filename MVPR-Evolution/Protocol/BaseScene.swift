//
//  BaseScene.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 14/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

protocol BaseScene {
    
    func setTarget()
    
}

extension BaseScene where Self : UIViewController {
    
    func setTarget() {
        Mirror(reflecting: self).children.forEach {
            guard let base = $0.value as? TransientOutletBase<Self> else { return }
            base.target = self
        }
    }
    
}
