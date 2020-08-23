//
//  BaseScene.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/06/04.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

public protocol BaseScene : class {
    
    func displayError(_ error: Error)
    
    /**
     - Returns: A `Deferred` instance whose result is the index of the action that was selected.
     */
    func displayErrorForResult(_ error: Error) -> Deferred<Int>
    
}

public extension BaseScene where Self : UIViewController {
    
    func displayError(_ error: Error) {
        _displayError(error)
    }
    
    func displayErrorForResult(_ error: Error) -> Deferred<Int> {
        let result = Deferred<Int>()
        _displayError(error, result: result)
        return result
    }
    
    private func _displayError(
        _ error: Error,
        result: Deferred<Int>? = nil)
    {
        let ac = UIAlertController(
            title: nil,
            message: error.localizedDescription,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default)
        { (_) in
            guard let result = result else { return }
            Deferred.resolve(result, with: 0)
        }
        
        ac.addAction(action)
        present(ac, animated: true)
    }
    
}
