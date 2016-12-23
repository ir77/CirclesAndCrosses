//
//  GameManager.swift
//  CirclesAndCrosses
//
//  Created by yuchimur on 2016/12/24.
//  Copyright © 2016年 内村　祐之. All rights reserved.
//

import Foundation

protocol GameDelegate {
    func gameOver(turn: Status)
}

class GameManager {
    private init() {}
    static let sharedInstance = GameManager()
    
    private var gameOverPatterns: [[Int]] {
        return [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            
            [0, 4, 8],
            [2, 4, 6]
        ]
    }

    func turn(board: [Status]) -> Status {
        return board.filter { $0 != .None }.count % 2 == 0 ? .Circle : .Cross
    }
    
    var delegate: GameDelegate?
    
    func checkGameOver(board: [Status]) {
        gameOverPatterns.forEach {
            checkLine(board: board, pattern: $0)
        }
    }
    
    private func checkLine(board: [Status], pattern: [Int]) {
        let line: [Status] = [board[pattern[0]], board[pattern[1]], board[pattern[2]]]
        if line.contains(.None) {
            return
        }
        
        let result = line.reduce(0) { $0.0 +  $0.1.rawValue }
        if result == Status.Circle.rawValue * 3 {
            delegate?.gameOver(turn: .Circle)
        } else if result == Status.Cross.rawValue * 3 {
            delegate?.gameOver(turn: .Cross)
        }
    }
}
