//
//  MainButtonPresenter.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

final class MainButtonPresenter : BasePresenter<MainButtonEventHandler>, MainButtonPresenting {
    
    weak var generateButton: UIButton! {
        didSet {
            // TODO: Use property wrapper to auto connect target action
            generateButton.addTarget(
                self,
                action: #selector(generateAction),
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
        call { $0.onTapGenerate(presenter: self) }
    }
    
}
