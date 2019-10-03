//
//  Game.swift
//  tic-tac-toe
//
//  Created by Etienne JEZEQUEL on 01/10/2019.
//  Copyright © 2019 Etienne JEZEQUEL. All rights reserved.
//

import Foundation

enum PlayersType {
    case first  // Cross
    case second // Cricle
}

enum GameState {
    case running
    case finished
}

private var currentPlayer: PlayersType = .first
private var board: Board = Board()
private var state: GameState = .running

class Game {
    
    func play(at index: Int) {
        switch state {
        case .running:
            board.playerPlay(at: index, player: currentPlayer) { finished in
                state = finished ? .finished : .running
            }
            currentPlayer = currentPlayer == .first ? .second : .first
        case .finished:
            print("Game finished")
        }
    }
    
    func getCurrentPlayer() -> PlayersType {
        return currentPlayer
    }
    
    func getGameState() -> GameState {
        return state
    }
}
