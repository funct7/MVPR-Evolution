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
    @TransientOutlet(keyPath: \MainViewController._textPresenter.textLabel)
    private var textLabel: UILabel!
    
    @IBOutlet
    @TransientOutlet(keyPath: \MainViewController._buttonPresenter.generateButton)
    private var generateButton: UIButton!
    
    @IBOutlet
    @TransientOutlet(keyPath: \MainViewController._buttonPresenter.changeColorButton)
    private var changeColorButton: UIButton!
    
    
    // MARK: Scene
    
    let reactor: MainBehavior = MainReactor()
    
    var textPresenter: MainTextPresenting { return _textPresenter }
    private let _textPresenter = MainTextPresenter()
    
    var buttonPresenter: MainButtonPresenting { return _buttonPresenter }
    private lazy var _buttonPresenter = MainButtonPresenter(queue: reactor.queue)

    
    override
    func loadView() {
        setTarget()
        super.loadView()
    }
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        reactor.scene = self
    }
    
}
