//
//  MainTextPresenter.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 13/04/2020.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

final class MainTextPresenter {

    weak var observeResultLabel: UILabel!
    weak var fetchResultLabel: UILabel!
        
    // MARK: Private
    
    private var colorList: [UIColor] = [.black, .red, .blue]
    
    @UpperBoundWrappingInt(value: 0, upperBound: 2)
    private var colorIndex: Int

}

extension MainTextPresenter : MainTextPresenting {
    
    func showObserveResult(_ text: String) {
        observeResultLabel.text = text
    }
    
    func showFetchResult(_ text: String) {
        fetchResultLabel.text = text
    }
    
    func changeTextColor() {
        colorIndex += 1
        
        observeResultLabel.textColor = selectedColor()
        fetchResultLabel.textColor = selectedColor()
    }
    
}

private extension MainTextPresenter {
    
    func selectedColor() -> UIColor { colorList[colorIndex] }
    
}
