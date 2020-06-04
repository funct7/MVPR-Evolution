//
//  MainViewController.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit
import Base

final class MainViewController: UIViewController, MainScene {
    
    @IBOutlet
    private var textLabel: UILabel! {
        get { $textPresenter.textLabel }
        set { $textPresenter.textLabel = newValue }
    }
    
    @IBOutlet
    private var generateButton: UIButton! {
        get { $buttonPresenter.generateButton }
        set { $buttonPresenter.generateButton = newValue }
    }
    
    @IBOutlet
    private var changeColorButton: UIButton! {
        get { $buttonPresenter.changeColorButton }
        set { $buttonPresenter.changeColorButton = newValue }
    }
    
    // MARK: Scene
    
    let reactor: MainBehavior = MainReactor()
    
    @Implementation(MainTextPresenter())
    var textPresenter: MainTextPresenting
    
    @Implementation(MainButtonPresenter())
    var buttonPresenter: MainButtonPresenting

    override
    func viewDidLoad() {
        super.viewDidLoad()
        reactor.scene = self
    }
    
}

