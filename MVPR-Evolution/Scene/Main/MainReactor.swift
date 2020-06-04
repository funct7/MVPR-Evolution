//
//  MainReactor.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation
import Base

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
    
    func onUpdate(worker: MainWorker, text: String) {
        dispatcher.ui(with: scene) { $0?.textPresenter.showObserveResult(text) }
    }
    
}

extension MainReactor : MainButtonEventHandler {
    
    func onTapObserve(presenter: MainButtonPresenting) {
        do {
            try worker.observe()
        } catch {
            dispatcher.ui(with: scene) { $0?.displayError(error) }
        }
    }
    
    func onTapRequest(presenter: MainButtonPresenting) {
        dispatcher.ui { presenter.isRequestEnabled = false }
        defer { dispatcher.ui { presenter.isRequestEnabled = true } }
        
        do {
            let text = try scene.reactor.worker.fetchUUID()
            
            dispatcher.ui(with: scene) {
                $0?.textPresenter.showFetchResult(text)
            }
        } catch {
            dispatcher.ui(with: scene) { $0?.displayError(error) }
        }
    }
    
    func onTapChangeColor(presenter: MainButtonPresenting) {
        dispatcher.ui(with: scene) { $0?.textPresenter.changeTextColor() }
    }
    
}

