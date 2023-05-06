//
//  BoardView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 28.4.23..
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var boardModel = BoardModel()
    @State private var xTurn = true
    @State private var showAlert = false
    @State private var continueGame = true
    @State private var alertText = ""
    @Binding var gameType: GameType?
    @Binding var difficultyLevel: DifficultyLevel?
    
    var maxDepth: Int {
        if difficultyLevel == .hard {
            return 5
        } else if difficultyLevel == .medium {
            return 2
        } else {
            return 1
        }
    }
    
    var body: some View {
        HStack {
            ForEach(0..<3) { x in
                VStack {
                    ForEach(0..<3) { y in
                        SquareView(value: boardModel.marks[x][y])
                            .onTapGesture {
                                Task{
                                    gameType == .twoPlayer ? await setMark2Player(x: x, y: y) : await setMark(x: x, y: y)
                                }
                                
                            }
                            .allowsHitTesting(continueGame)
                    }
                }
                .alert(alertText, isPresented: $showAlert) {
                    Button("Close", role: .destructive) { }
                    Button("Play again", role: .cancel) { restart() }
                }
                
            }
        }
    }
    
    func checkGameState() {
        let gameState = boardModel.evaluate()
        
        if gameState == 10 {
            continueGame = false
            showAlert = true
            alertText = "X won!"
        } else if gameState == -10 {
            continueGame = false
            showAlert = true
            alertText = "O won!"
        } else if gameState == 0 && !boardModel.isMovesLeft() {
            continueGame = false
            showAlert = true
            alertText = "Draw"
        }
    }
    
    func setMark(x: Int, y: Int) async {
        let moveSuccesful = boardModel.canSetMark(x: x, y: y, mark: Mark.x)
        
        if !moveSuccesful {
            return
        }
        
        checkGameState()
        
        if continueGame {
            let findBestMoveTask = Task {
                return boardModel.findBestMove(maxDepth: maxDepth)
            }
            
            let bestMove = await findBestMoveTask.value;
            
            boardModel.marks[bestMove.row][bestMove.col] = .o
            
            checkGameState()
        }
        
    }
    
    func setMark2Player(x: Int, y: Int) async {
        let moveSuccesful = boardModel.canSetMark(x: x, y: y, mark: xTurn ? Mark.x : Mark.o)
        
        if moveSuccesful {
            xTurn.toggle()
        }
        
        let gameState = boardModel.evaluate()
        
        
        if gameState == 10 {
            continueGame = false
            showAlert = true
            alertText = "X won!"
        } else if gameState == -10 {
            continueGame = false
            showAlert = true
            alertText = "O won!"
        } else if gameState == 0 && !boardModel.isMovesLeft() {
            continueGame = false
            showAlert = true
            alertText = "Draw"
        }
    }
    
    func restart() {
        boardModel.restart()
        xTurn = true
        showAlert = false
        continueGame = true
    }
}

//struct BoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardView()
//    }
//}
