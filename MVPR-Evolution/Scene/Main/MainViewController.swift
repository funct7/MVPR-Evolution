//
//  MainViewController.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit
import MVPRKit

final class MainViewController: UIViewController, MainScene {
    
    @IBOutlet
    private var observeResultLabel: UILabel! {
        get { $textPresenter.observeResultLabel }
        set { $textPresenter.observeResultLabel = newValue }
    }
    
    @IBOutlet
    private var fetchResultLabel: UILabel! {
        get { $textPresenter.fetchResultLabel }
        set { $textPresenter.fetchResultLabel = newValue }
    }
    
    @IBOutlet
    private var observeButton: UIButton! {
        get { $buttonPresenter.observeButton }
        set { $buttonPresenter.observeButton = newValue }
    }
    
    @IBOutlet
    private var requestButton: UIButton! {
        get { $buttonPresenter.requestButton }
        set { $buttonPresenter.requestButton = newValue }
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
    
    // MARK: Inherited
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        reactor.scene = self
    }
        
}

