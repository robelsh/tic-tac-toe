//
//  TTTBoardViewController.swift
//  TicTacToe
//
//  Created by Etienne Jézéquel on 05/03/2019.
//  Copyright © 2019 Etienne. All rights reserved.
//

import UIKit

class TTTBoardViewController: UIViewController {
    
    // MARK: - Privates
    
    // MARK: - Publics
    
    // MARK: - IBOutlet
    
    // MARK: - Application Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Actions
    @IBAction func handleTouchCell(_ sender: AnyObject) {
        sender.setImage(Asset.cross.image, for: .normal)
    }
    
    @IBAction func handleReset(_ sender: Any) {
        
    }
    
}

// MARK: - TTTBoardViewController
extension TTTBoardViewController {
    
    // MARK: - Configurations
    fileprivate func setup() {
        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    
    // MARK: - Privates Functions
    
    // MARK: - Publics Functions
}
