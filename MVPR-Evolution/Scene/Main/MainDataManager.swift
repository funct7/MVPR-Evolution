//
//  MainDataManager.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

final class MainDataManager : MainWorker {
    
    weak var handler: MainWorkerEventHandler!
    
    func observe() throws {
        timer = Timer(
            timeInterval: 1,
            repeats: true)
        { [weak self] (_) in
            self?.handler.call { $0.onUpdate(worker: self!, text: UUID().uuidString) }
        }
        
        RunLoop.main.add(timer!, forMode: .default)
    }
    
    func fetchUUID() throws -> String {
        sleep(3)
        return UUID().uuidString
    }
    
    // MARK: Private
    
    private var timer: Timer? {
        willSet { timer?.invalidate() }
    }
    
}
