//
//  BaseEventHandler.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/06/04.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public protocol BaseEventHandler : class {
    
    func call(_ block: @escaping (Self) -> Void)
    
}
