//
//  BaseReactor+Default.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/08/23.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation
import MVPRKit

extension BaseReactor {
    
    convenience init() {
        self.init(dispatcher: .init(worker: .global()))
    }
    
}
