//
//  MainButtonPresenter.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

final class MainButtonPresenter : CallbackBindablePresenter<MainButtonPresenting>, MainButtonPresenting {
    
    var onTapChangeColor: ((MainButtonPresenting) -> Void)?
    
    var onTapGenerate: ((MainButtonPresenting) -> Void)?
    
    @CallbackBindable(keyPath: \MainButtonPresenting.onTapGenerate)
    var generateButton: UIButton!
    
    @CallbackBindable(keyPath: \MainButtonPresenting.onTapChangeColor)
    var changeColorButton: UIButton!
    
    var isEnabled: Bool {
        get { generateButton.isEnabled }
        set { generateButton.isEnabled = newValue }
    }
    
}
