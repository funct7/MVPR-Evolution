//
//  MainReactor.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

final class MainReactor : BaseReactor, MainBehavior {
    
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
        dispatcher.ui { presenter.isEnabled = false }
        
        let text = scene.reactor.worker.fetchText()
        
        dispatcher.ui { [scene] in
            scene?.textPresenter.showText(text)
            presenter.isEnabled = true
        }
    }
    
    func onTapChangeColor(presenter: MainButtonPresenting) {
        dispatcher.ui(with: scene) { $0.textPresenter.changeColor() }
    }
    
}

