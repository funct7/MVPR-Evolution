//
//  MainTextPresenter.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

final class MainTextPresenter {

    weak var textLabel: UILabel!
    
    private var colorList: [UIColor] = [.black, .red, .blue]
    
    @UpperBoundWrappingInt(value: 0, upperBound: 2)
    private var colorIndex: Int
    
}

extension MainTextPresenter : MainTextPresenting {

    func changeColor() {
        colorIndex += 1
        textLabel.textColor = colorList[colorIndex]
    }

    func showText(_ text: String) {
        textLabel.text = text
    }

}
