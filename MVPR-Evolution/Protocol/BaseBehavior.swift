//
//  BaseBehavior.swift
//  MVPR-Evolution
//
//  Created by Joshua Park on 2020/04/13.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

protocol BaseBehavior : class {
    
    var queue: DispatchQueue { get }
    
}
