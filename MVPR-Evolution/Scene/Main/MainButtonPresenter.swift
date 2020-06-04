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
    
    weak var observeButton: UIButton! {
        didSet {
            observeButton.addTarget(
                self,
                action: #selector(observeAction),
                for: .touchUpInside)
        }
    }
    
    weak var requestButton: UIButton! {
        didSet {
            // TODO: Use property wrapper to auto connect target action
            requestButton.addTarget(
                self,
                action: #selector(requestAction),
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
    
    var isRequestEnabled: Bool {
        get { requestButton.isEnabled }
        set { requestButton.isEnabled = newValue }
    }
    
}

private extension MainButtonPresenter {
    
    @objc
    func observeAction() {
        handler?.call { $0.onTapObserve(presenter: self) }
    }
    
    @objc
    func requestAction() {
        handler?.call { $0.onTapRequest(presenter: self) }
    }
    
    @objc
    func changeColorAction() {
        handler?.call { $0.onTapChangeColor(presenter: self) }
    }
    
}
