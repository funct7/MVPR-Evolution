//
//  Dispatchable.swift
//  MVPR-Evolution
//
//  Created by Joshua Park on 2020/04/22.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

protocol Dispatchable : class {
    
    var queue: DispatchQueue { get set }
    
}
