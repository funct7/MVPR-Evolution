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
    
    func displayColorPicker() -> Deferred<UIColor> {
        let result = Deferred<UIColor>()
        
        let ac = UIAlertController(
            title: nil,
            message: "Choose a background color",
            preferredStyle: .actionSheet)
        let action1 = UIAlertAction(
            title: "red",
            style: .default)
        { (_) in
            Deferred.resolve(result, with: .systemRed)
        }
        let action2 = UIAlertAction(
            title: "green",
            style: .default)
        { (_) in
            Deferred.resolve(result, with: .systemGreen)
        }
        let action3 = UIAlertAction(
            title: "white",
            style: .default)
        { (_) in
            Deferred.resolve(result, with: .white)
        }
        ac.addAction(action1)
        ac.addAction(action2)
        ac.addAction(action3)
        
        present(ac, animated: true)
        
        return result
    }
    
    func setBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
    // MARK: Inherited
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        reactor.scene = self
    }
    
    // MARK: Private
    
    @IBAction
    private func setBackgroundAction(_ sender: UIButton) {
        reactor.call { $0.onTapChooseBackgroundColor() }
    }
        
}
