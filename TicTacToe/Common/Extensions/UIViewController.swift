//
//  Extensions.swift
//  TicTacToe
//
//  Created by Etienne Jézéquel on 3/5/19
//  Copyright (c) 2019 Etienne. All rights reserved.
//

import UIKit

// MARK: UITextField
extension UIViewController {
    
    /// change root viewController
    func changeRootViewControllerTo(_ newRootViewController: UIViewController) {
        navigationController?.viewControllers = [newRootViewController]
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    /// add gesture to dismiss keyboard
    func addKeyboardDismissGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
}
