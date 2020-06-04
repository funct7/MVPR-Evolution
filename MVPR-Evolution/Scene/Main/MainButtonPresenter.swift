//
//  MainButtonPresenter.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

final class MainButtonPresenter : MainButtonPresenting {
    
    weak var handler: MainButtonEventHandler?
    
    weak var generateButton: UIButton! {
        didSet {
            // TODO: Use property wrapper to auto connect target action
            generateButton.addTarget(
                self,
                action: #selector(generateAction),
                for: .touchUpInside)
        }
    }
    
    weak var changeColorButton: UIButton! {
        didSet {
            changeColorButton.addTarget(
                self,
                action: #selector(changeColorAction),
                for: .touchUpInside)
        }
    }
    
    var isEnabled: Bool {
        get { generateButton.isEnabled }
        set { generateButton.isEnabled = newValue }
    }
    
}

private extension MainButtonPresenter {
    
    @objc
    func generateAction() {
        handler?.call { $0.onTapGenerate(presenter: self) }
    }
    
    @objc
    func changeColorAction() {
        handler?.call { $0.onTapChangeColor(presenter: self) }
    }
    
}
