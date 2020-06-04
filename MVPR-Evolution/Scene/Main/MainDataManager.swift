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
    
    func fetchText() -> String {
        sleep(3)
        let result = UUID().uuidString
        handler.onFetch(worker: self, text: result)
        return result
    }

}
