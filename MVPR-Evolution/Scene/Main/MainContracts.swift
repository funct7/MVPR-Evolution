//
//  MainContracts.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

protocol MainScene : NSObjectProtocol {
    var reactor: MainBehavior { get }
    
    var textPresenter: MainTextPresenting { get }
    var buttonPresenter: MainButtonPresenting { get }
}

protocol MainBehavior : class {
    var worker: MainWorker { get set }
}

protocol MainWorker : class {
    func fetchText() -> String
}

protocol MainTextPresenting : class {
    func showText(_ text: String)
}

protocol MainButtonEventHandler : class {
    func onTapGenerate(presenter: MainButtonPresenting)
}

protocol MainButtonPresenting: class {
    var handler: MainButtonEventHandler! { get set }
    var isEnabled: Bool { get set }
}
