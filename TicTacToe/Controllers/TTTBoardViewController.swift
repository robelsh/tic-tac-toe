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
    private var viewModel: TTBoardViewModel = TTBoardViewModel()
    
    // MARK: - Publics
    
    // MARK: - IBOutlet
    
    // MARK: - Application Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Actions
    @IBAction func handleTouchCell(_ sender: AnyObject) {
        if let index = sender.tag {
            (sender as? UIButton)?.isUserInteractionEnabled = false
            sender.setImage(viewModel.getImageForPlayer().image, for: .normal)
            viewModel.didPlay(at: index)
        }
    }
    
    @IBAction func handleReset(_ sender: Any) {
        viewModel = TTBoardViewModel()
        for index in 1...Constants.numberOfCell {
            let button = view.viewWithTag(index) as? UIButton
            button?.isUserInteractionEnabled = true
            button?.setImage(nil, for: .normal)
        }
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
