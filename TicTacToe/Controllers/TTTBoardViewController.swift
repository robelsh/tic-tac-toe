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
    @IBOutlet fileprivate weak var boardView: UIView!
    @IBOutlet fileprivate weak var gameStateLbl: UILabel!
    
    // MARK: - Application Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Actions
    @IBAction func handleTouchCell(_ sender: AnyObject) {
        if let index = sender.tag {
            (sender as? UIButton)?.isUserInteractionEnabled = false
            
            switch viewModel.getCurrentPlayer() {
            case .first:
                sender.setImage(Asset.cross.image, for: .normal)
            case .second:
                sender.setImage(Asset.circle.image, for: .normal)
            }
            
            viewModel.didPlay(at: index, { state in
                self.boardView.isUserInteractionEnabled = false
                switch state {
                case .win:
                    self.gameStateLbl.text = L10n.mainGameStateWin(self.viewModel.getCurrentPlayer() == .first ? "1" : "2")
                case .draw:
                    self.gameStateLbl.text = L10n.mainGameStateDraw
                default:
                    break
                }
            })
        }
    }
    
    @IBAction func handleReset(_ sender: Any) {
        boardView.isUserInteractionEnabled = true
        gameStateLbl.text = ""
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
        gameStateLbl.text = ""
    }
    
    // MARK: - Privates Functions
    
    // MARK: - Publics Functions
}
