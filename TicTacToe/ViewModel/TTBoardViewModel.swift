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

enum GameState {
    case running
    case draw
    case win
}

class TTBoardViewModel {
    
    // MARK: - Privates
    private var board: [PlayersType: [Int]] = [:]
    private var currentPlayer: PlayersType = .first
    private var state: GameState = .running
    
    init() {
        board[.first] = []
        board[.second] = []
    }
    
    // MARK: - Privates Functions
    private func nextTurn() {
        currentPlayer = currentPlayer == .first ? .second : .first
    }
    
    private func boardIsFull() -> Bool {
        let count = (board[.first]?.count ?? 0) + (board[.second]?.count ?? 0)
        let isFull = count == Constants.numberOfCell
        state = isFull ? .draw : state
        return isFull
    }
    
    private func boardIsWin() -> Bool {
        
        for solution in Constants.solutions {
            var isWinArray: [Bool] = []
            for value in solution {
                isWinArray.append(board[currentPlayer]?.contains(value) ?? false)
            }
            if !isWinArray.contains(false) {
                state = .win
                return true
            }
        }
        return false
    }
    
    // MARK: - Publics Functions
    func getCurrentPlayer() -> PlayersType {
        return currentPlayer
    }
    
    func didPlay(at index: Int, _ didFinish: ((GameState) -> Void)? = nil) {
        board[currentPlayer]?.append(index)
        if boardIsWin() || boardIsFull() {
            didFinish?(state)
        } else {
            nextTurn()
        }
    }
    
    func getBoard(of player: PlayersType) -> [Int] {
        return board[player] ?? []
    }
    
    func getState() -> GameState {
        return state
    }
}
