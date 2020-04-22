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
    @Transitive(keyPath: \MainViewController.$textPresenter.textLabel)
    private var textLabel: UILabel!
    
    @IBOutlet
    @Transitive(keyPath: \MainViewController.$buttonPresenter.generateButton)
    private var generateButton: UIButton!
    
    @IBOutlet
    @Transitive(keyPath: \MainViewController.$buttonPresenter.changeColorButton)
    private var changeColorButton: UIButton!
    
    
    // MARK: Scene
    
    @Implementation(MainReactor())
    var reactor: MainBehavior
    
    @Implementation(MainTextPresenter())
    var textPresenter: MainTextPresenting
    
    @Implementation(MainButtonPresenter())
    var buttonPresenter: MainButtonPresenting
    
    override
    func loadView() {
        setUp()
        super.loadView()
    }
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        reactor.scene = self
    }
    
}

extension MainScene where Self : UIViewController {
    
    func setUp() {
        Mirror(reflecting: self).children.forEach {
            if let base = $0.value as? TransientOutletBase<Self> { base.target = self }
            if let dispatchable = $0.value as? Dispatchable { dispatchable.queue = reactor.queue }
        }
    }
    
}
