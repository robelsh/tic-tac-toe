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
    @IBOutlet fileprivate weak var currentPlayerLbl: UILabel!
    @IBOutlet fileprivate weak var resetBtn: UIButton!
    
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
            
            currentPlayerLbl.text = viewModel.getCurrentPlayer() == .first ? L10n.mainLblCurrentPlayer(1) : L10n.mainLblCurrentPlayer(2)
            viewModel.didPlay(at: index, { state in
                self.boardView.isUserInteractionEnabled = false
                switch state {
                case .win:
                    self.boardView.backgroundColor = ColorName.green.color
                    self.gameStateLbl.text = L10n.mainGameStateWin(self.viewModel.getCurrentPlayer() == .first ? "1" : "2")
                case .draw:
                    self.boardView.backgroundColor = ColorName.red.color
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
        boardView.backgroundColor = ColorName.black.color
        currentPlayerLbl.text = L10n.mainLblCurrentPlayer(1)
        viewModel = TTBoardViewModel()
        
        // Reset Buttons
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
        // Init view
        gameStateLbl.text = ""
        currentPlayerLbl.text = ""
        gameStateLbl.font = UIFont(font: FontFamily.Merriweather.regular, size: 12)
        currentPlayerLbl.font = UIFont(font: FontFamily.Merriweather.regular, size: 12)
        boardView.backgroundColor = ColorName.black.color
        resetBtn.setTitle(L10n.mainBtnReset, for: .normal)
    }
}
