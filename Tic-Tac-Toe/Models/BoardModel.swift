//
//  BoardModel.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 28.4.23..
//

import Foundation

class BoardModel: ObservableObject {
    @Published var marks: [[Mark]] = [[.blank, .blank, .blank], [.blank, .blank, .blank], [.blank, .blank, .blank]]
    
    func canSetMark(x: Int, y: Int, mark: Mark) -> Bool {
        if marks[x][y] == .blank {
            marks[x][y] = mark
            return true
        }
        
        return false
    }
    /// ai part
    
    func isMovesLeft() -> Bool {
        for i in 0..<marks.count {
            for j in 0..<marks.count {
                if marks[i][j] == .blank {
                    return true
                }
            }
        }
        
        return false
    }
    
    func evaluate() -> Int {
        if xWon() {
            //print("X won!")
            return 10
        } else if oWon() {
            //print("O won!")
            return -10
        } else {
            //print("Continue")
            return 0
        }
    }
    
    
    func findBestValue(for mark: Mark, isMax: Bool, depth: Int, maxDepth: Int) -> Int {
        var bestValue = isMax ? -1000 : 1000
        if depth > maxDepth {
            return bestValue
        }
        
        for i in 0..<marks.count {
            for j in 0..<marks.count {
                if marks[i][j] == .blank {
                    marks[i][j] = mark
                    
                    let result = minmax(isMax: !isMax, depth: depth + 1, maxDepth: maxDepth);
                    
                    if isMax {
                        bestValue = max(bestValue, result)
                    } else {
                        bestValue = min(bestValue, result)
                    }
                    
                    marks[i][j] = .blank
                }
            }
        }
        
        return isMax ? bestValue - depth : bestValue + depth
    }
    
    
    func minmax(isMax: Bool, depth: Int, maxDepth: Int) -> Int {
        let score = -1 * evaluate()
        
        if score == 10 || score == -10 {
            return score
        }
        
        if !isMovesLeft() {
            return 0
        }
        
        return isMax ? findBestValue(for: .o, isMax: isMax, depth: depth, maxDepth: maxDepth) : findBestValue(for: .x, isMax: isMax, depth: depth, maxDepth: maxDepth)
    }
    
    func findBestMove(maxDepth: Int) -> Move {
        var bestValue = -1000
        let bestMove = Move(row: -1, col: -1)
        
        let xStart = Int.random(in: 0...2)
        let yStart = Int.random(in: 0...2)
        
        for x in xStart..<xStart + 3 {
            for y in yStart..<yStart + 3 {
                var i = x%3
                var j = y%3
                
                if marks[i][j] == .blank {
                    marks[i][j] = .o
                    
                    let moveValue = minmax(isMax: false, depth: 0, maxDepth: maxDepth)
                    
                    marks[i][j] = .blank
                    
                    if (moveValue > bestValue) {
                        bestMove.row = i;
                        bestMove.col = j;
                        bestValue = moveValue;
                    }
                }
            }
        }
        
        print(bestValue)
        
        return bestMove
    }
    
    /// end ai part
    
    func checkIfWins(_ mark: Mark) -> Bool {
        /// rows
        for i in 0..<marks.count {
            var isMark = true
            
            for j in 0..<marks.count {
                if marks[i][j] != mark {
                    isMark = false
                }
            }
            
            if isMark {
                return true
            }
        }
        
        /// columns
        for i in 0..<marks.count {
            var isMark = true
            
            for j in 0..<marks.count {
                if marks[j][i] != mark {
                    isMark = false
                }
            }
            
            if isMark {
                return true
            }
        }
        
        
        /// diagonals
        var isMark = true
        
        for i in 0..<marks.count {
            if marks[i][i] != mark {
                isMark = false
            }
        }
        
        if isMark {
            return true
        }
        
        isMark = true
        
        for i in 0..<marks.count {
            
            if marks[i][marks.count - 1 - i] != mark {
                isMark = false
            }
        }
        
        if isMark {
            return true
        }
        
        return false
        
    }
    
    func xWon() -> Bool {
        checkIfWins(.x)
    }
    
    func oWon() -> Bool {
        checkIfWins(.o)
    }
    
    func draw() -> Bool {
        for row in marks {
            for mark in row {
                if mark == .blank {
                    return false
                }
            }
        }
        
        return !xWon() && !oWon()
    }
    
    func continueGame() -> Bool {
        !xWon() && !oWon() && !draw()
    }
    
    func restart() {
        for i in 0..<marks.count {
            for j in 0..<marks.count {
                marks[i][j] = .blank
            }
        }
    }
}
