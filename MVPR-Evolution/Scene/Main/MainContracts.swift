//
//  MainContracts.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation
import Base

protocol MainScene : BaseScene {
    var reactor: MainBehavior { get }
    
    var textPresenter: MainTextPresenting { get }
    var buttonPresenter: MainButtonPresenting { get }
}

protocol MainBehavior : BaseReactorType {
    var scene: MainScene! { get set }
    var worker: MainWorker { get set }
}

protocol MainWorkerEventHandler : BaseEventHandler {
    func onFetch(worker: MainWorker, text: String)
    func onFetchFailure(worker: MainWorker, error: Error)
}

protocol MainWorker : class {
    var handler: MainWorkerEventHandler! { get set }
    func fetchText() -> String
}

protocol MainTextPresenting : class {
    func changeColor()
    func showText(_ text: String)
}

protocol MainButtonEventHandler : BaseEventHandler {
    func onTapGenerate(presenter: MainButtonPresenting)
    func onTapChangeColor(presenter: MainButtonPresenting)
}

protocol MainButtonPresenting: class {
    var handler: MainButtonEventHandler? { get set }
    var isEnabled: Bool { get set }
}
