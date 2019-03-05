//
//  AppDelegate.swift
//  TicTacToe
//
//  Created by Etienne Jézéquel on 3/5/19
//  Copyright (c) 2019 Etienne. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        /* IQKeyboardManager Setup */
        IQKeyboardManagerSetup()

        /* Logger */
        TTTLogger.setup()

        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

}

extension AppDelegate {

    fileprivate func IQKeyboardManagerSetup() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "close"
    }
}
