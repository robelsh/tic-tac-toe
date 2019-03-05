//
//  TTBoardViewModel.swift
//  TicTacToe
//
//  Created by Etienne Jézéquel on 05/03/2019.
//  Copyright © 2019 Etienne. All rights reserved.
//

import Foundation

enum PlayersType {
    case first  // Cross
    case second // Cricle
}

class TTBoardViewModel {
    
    // MARK: - Privates
    private var board: [Int] = []
    private var currentPlayer: PlayersType = .first
    
    // MARK: - Privates Functions
    private func nextTurn() {
        currentPlayer = currentPlayer == .first ? .second : .first
    }
    
    // MARK: - Publics Functions
    func getCurrentPlayer() -> PlayersType {
        return currentPlayer
    }
    
    func getImageForPlayer() -> ImageAsset {
        switch currentPlayer {
        case .first:
            return Asset.cross
        case .second:
            return Asset.circle
        }
    }
    
    func didPlay(at index: Int) {
        board.append(index)
        board.sort()
        nextTurn()
    }
}
