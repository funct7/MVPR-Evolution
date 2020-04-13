//
//  MainViewController.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, MainScene {
    
    @IBOutlet
    private var textLabel: UILabel! {
        get { _textPresenter.textLabel }
        set { _textPresenter.textLabel = newValue }
    }
    
    @IBOutlet
    private var generateButton: UIButton! {
        get { _buttonPresenter.generateButton }
        set { _buttonPresenter.generateButton = newValue }
    }
    
    // MARK: Scene
    
    let reactor: MainBehavior = MainReactor()
    
    var textPresenter: MainTextPresenting { return _textPresenter }
    private let _textPresenter = MainTextPresenter()
    
    var buttonPresenter: MainButtonPresenting { return _buttonPresenter }
    private let _buttonPresenter = MainButtonPresenter()

}

final class MainReactor : MainBehavior {
    var worker: MainWorker = MainDataManager()
}

final class MainDataManager : MainWorker {
    func fetchText() -> String{
        sleep(3)
        return UUID().uuidString
    }
}

final class MainTextPresenter : MainTextPresenting {
    weak var textLabel: UILabel!
    func showText(_ text: String) {
        
    }
}

final class MainButtonPresenter : MainButtonPresenting {
    weak var generateButton: UIButton!
    
    weak var handler: MainButtonEventHandler!
    
    var isEnabled: Bool {
        get { generateButton.isEnabled }
        set { generateButton.isEnabled = newValue }
    }
}
