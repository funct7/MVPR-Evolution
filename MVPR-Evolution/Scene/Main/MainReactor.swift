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
            setUpButtonPresenter()
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

extension MainReactor {
    
    func setUpButtonPresenter() {
        scene.buttonPresenter.onTapGenerate = { [scene] (presenter) in
            guard let scene = scene else { return }
            
            ui.sync { presenter.isEnabled = false }

            let text = scene.reactor.worker.fetchText()

            ui.sync {
                scene.textPresenter.showText(text)
                presenter.isEnabled = true
            }
        }
        
        scene.buttonPresenter.onTapChangeColor = { [scene] (_) in
            ui.sync { scene?.textPresenter.changeColor() }
        }
    }

}

