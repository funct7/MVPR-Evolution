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
    
    @IBOutlet
    private var changeColorButton: UIButton! {
        get { _buttonPresenter.changeColorButton }
        set { _buttonPresenter.changeColorButton = newValue }
    }
    
    
    // MARK: Scene
    
    let reactor: MainBehavior = MainReactor()
    
    var textPresenter: MainTextPresenting { return _textPresenter }
    private let _textPresenter = MainTextPresenter()
    
    var buttonPresenter: MainButtonPresenting { return _buttonPresenter }
    private let _buttonPresenter = MainButtonPresenter()

    override
    func viewDidLoad() {
        super.viewDidLoad()
        reactor.scene = self
    }
    
}

