//
//  BaseScene.swift
//  MVPR-Evolution
//
//  Created by Josh Woomin Park on 2020/06/04.
//  Copyright © 2020 Knowre. All rights reserved.
//

import UIKit

protocol BaseScene : class {
    
    func displayError(_ error: Error)
    
    func displayError(
        _ error: Error,
        result: AsyncResult<Int>)
    
}

extension BaseScene where Self : UIViewController {
    
    func displayError(_ error: Error) {
        _displayError(error, result: nil)
    }
    
    func displayError(
        _ error: Error,
        result: AsyncResult<Int>)
    {
        _displayError(error, result: result)
    }
    
    private func _displayError(
        _ error: Error,
        result: AsyncResult<Int>?)
    {
        let ac = UIAlertController(
            title: nil,
            message: error.localizedDescription,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default)
        { (_) in
            result?.done(result: 0)
        }
        
        ac.addAction(action)
        present(ac, animated: true)
    }
    
}
