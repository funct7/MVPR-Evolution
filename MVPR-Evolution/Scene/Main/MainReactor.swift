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
    
    let queue: DispatchQueue = .init(
        label: "workerQueue.MainScene",
        qos: .userInteractive,
        attributes: .concurrent)
    
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
        ui.sync { presenter.isEnabled = false }
        
        let text = scene.reactor.worker.fetchText()
        
        ui.sync { [scene] in
            scene?.textPresenter.showText(text)
            presenter.isEnabled = true
        }
    }
    
    func onTapChangeColor(presenter: MainButtonPresenting) {
        ui.sync { [scene] in scene?.textPresenter.changeColor() }
    }
    
}

