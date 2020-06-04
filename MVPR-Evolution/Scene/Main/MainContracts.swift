//
//  MainContracts.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation
import MVPRKit

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
    /**
     `observe()`의 결과를 받는 콜백함수.
     */
    func onUpdate(worker: MainWorker, text: String)
}

protocol MainWorker : class {
    var handler: MainWorkerEventHandler! { get set }
    
    func observe() throws
    func fetchUUID() throws -> String
}

protocol MainTextPresenting : class {
    func showObserveResult(_ text: String)
    func showFetchResult(_ text: String)
    func changeTextColor()
}

protocol MainButtonEventHandler : BaseEventHandler {
    func onTapObserve(presenter: MainButtonPresenting)
    func onTapRequest(presenter: MainButtonPresenting)
    func onTapChangeColor(presenter: MainButtonPresenting)
}

protocol MainButtonPresenting: class {
    var handler: MainButtonEventHandler? { get set }
    var isRequestEnabled: Bool { get set }
}
