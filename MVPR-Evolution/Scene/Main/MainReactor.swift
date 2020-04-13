//
//  MainReactor.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

private let ui = DispatchQueue.main

final class MainReactor : MainBehavior {
    
    weak var scene: MainScene! {
        didSet {
            worker.handler = self
            scene.buttonPresenter.handler = self
        }
    }
    
    var worker: MainWorker = MainDataManager()
    
}

extension MainReactor : MainWorkerEventHandler {
    
    func onFetch(worker: MainWorker, text: String) {
        print("fetched text \(text)")
    }
    
    func onFetchFailure(worker: MainWorker, error: Error) {
        print("fetched failed \(error)")
    }
    
}

extension MainReactor : MainButtonEventHandler {
    
    func onTapGenerate(presenter: MainButtonPresenting) {
        print(#function, Thread.current)
        ui.sync { presenter.isEnabled = false }
        
        let text = scene.reactor.worker.fetchText()
        print(self, text)
        ui.sync { [scene] in
            scene?.textPresenter.showText(text)
            presenter.isEnabled = true
        }
    }
    
}

