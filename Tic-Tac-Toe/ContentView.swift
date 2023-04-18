//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 16.4.23..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            TitleView()
            Spacer()
            BoardView()
            Spacer()
            ConnectView()
            Spacer()
        }
        .padding()
    }
}

struct TitleView: View {
    var body: some View {
        Text("Tic Tac Toe")
            .font(.title)
            .bold()
        Text("By Hermine Militonyan")
            .font(.caption2)
            .foregroundColor(.secondary)
            .italic()
    }
}

struct ConnectView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var githubLogo: String {
        colorScheme == .dark ? "github-mark-white" : "github-mark"
    }
    
    var body: some View {
        VStack {
            Text("Connect with me")
                .font(.caption)
            Link(destination: URL(string: "https://github.com/militonyan98")!) {
                Image(githubLogo)
                    .resizable()
                    .frame(width: 30,height: 30)
            }
        }
    }
}

enum Mark {
    case x, o, blank
}

struct SquareView: View {
    var value: Mark
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.red)
                .frame(width: 90, height: 90)
            
            value != .blank ? Image(systemName: value == .x ? "xmark" : "circle") : Image(systemName: "")
        }
        .padding(1)
    }
}

class BoardModel: ObservableObject {
    @Published var marks: [[Mark]] = [[.blank, .blank, .blank], [.blank, .blank, .blank], [.blank, .blank, .blank]]
    
    func canSetMark(x: Int, y: Int, mark: Mark) -> Bool {
        if marks[x][y] == .blank {
            marks[x][y] = mark
            return true
        }
        
        return false
    }
    
    func evaluate() -> GameResult {
        if xWon() {
            print("X won!")
            return .xWon
        } else if oWon() {
            print("O won!")
            return .oWon
        } else if draw() {
            print("Draw")
            return .draw
        } else {
            print("Continue")
            return .continueGame
        }
        
    }
    
    enum GameResult {
        case xWon, oWon, draw, continueGame
    }
    
    func checkIfWins(_ mark: Mark) -> Bool {
        // rows
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
        
        // columns
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
        
        
        // diagonals
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

struct BoardView: View {
    @ObservedObject var boardModel = BoardModel()
    @State var xTurn = true
    @State private var showAlert = false
    @State private var continueGame = true
    @State private var alertText = ""
    
    var body: some View {
        HStack {
            ForEach(0..<3) { x in
                VStack {
                    ForEach(0..<3) { y in
                        SquareView(value: boardModel.marks[x][y])
                            .onTapGesture {
                                setMark(x: x, y: y)
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
    
    func setMark(x: Int, y: Int) {
        let moveSuccesful = boardModel.canSetMark(x: x, y: y, mark: xTurn ? Mark.x : Mark.o)
        
        if moveSuccesful {
            xTurn.toggle()
        }
        
        let gameState = boardModel.evaluate()
        
        if gameState == .xWon {
            continueGame = false
            showAlert = true
            alertText = "X won!"
        } else if gameState == .oWon {
            continueGame = false
            showAlert = true
            alertText = "O won!"
        } else if gameState == .draw {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
