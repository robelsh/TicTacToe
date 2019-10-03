//
//  Board.swift
//  tic-tac-toe
//
//  Created by Etienne JEZEQUEL on 01/10/2019.
//  Copyright © 2019 Etienne JEZEQUEL. All rights reserved.
//

import Foundation

enum BoardState: String {
    case running = "running"
    case draw = "draw"
    case win = "win"
}

class Board {
    
    private var board: [PlayersType: [Int]] = [:]
    private var state: BoardState = .running

    init() {
        board[.first] = []
        board[.second] = []
    }
    
    func playerPlay(at index: Int, player: PlayersType, _ didFinish: ((Bool) -> Void)? = nil) {
        board[player]?.append(index)
        if boardIsWin(by: player) || boardIsFull() {
            print(state)
            didFinish?(true)
        } else {
            didFinish?(false)
        }
    }
    
    func boardIsFull() -> Bool {
        let count = (board[.first]?.count ?? 0) + (board[.second]?.count ?? 0)
        let isFull = count == Constants.numberOfCell
        state = isFull ? .draw : state
        return isFull
    }
    
    private func boardIsWin(by player: PlayersType) -> Bool {
        
        for solution in Constants.solutions {
            var isWinArray: [Bool] = []
            for value in solution {
                isWinArray.append(board[player]?.contains(value) ?? false)
            }
            if !isWinArray.contains(false) {
                state = .win
                return true
            }
        }
        return false
    }
}
