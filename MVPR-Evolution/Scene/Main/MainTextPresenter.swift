//
//  MainTextPresenter.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

final class MainTextPresenter : MainTextPresenting {

    weak var textLabel: UILabel!

    func showText(_ text: String) {
        print(#function, Thread.current)
        textLabel.text = text
    }

}
