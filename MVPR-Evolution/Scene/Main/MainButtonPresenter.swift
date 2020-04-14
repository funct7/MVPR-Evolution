//
//  MainButtonPresenter.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

final class MainButtonPresenter : BasePresenter<MainButtonEventHandler>, MainButtonPresenting {
    
    @ActionBindable(action: #selector(generateAction))
    var generateButton: UIButton!
    
    @ActionBindable(action: #selector(changeColorAction))
    var changeColorButton: UIButton! 
    
    var isEnabled: Bool {
        get { generateButton.isEnabled }
        set { generateButton.isEnabled = newValue }
    }
    
}

private extension MainButtonPresenter {
    
    @objc
    func generateAction() {
        call { $0.onTapGenerate(presenter: self) }
    }
    
    @objc
    func changeColorAction() {
        call { $0.onTapChangeColor(presenter: self) }
    }
    
}
