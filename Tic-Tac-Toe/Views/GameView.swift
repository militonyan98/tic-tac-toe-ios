//
//  GameView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 3.5.23..
//

import SwiftUI

struct GameView: View {
    @State var gameType: GameType?
    @Binding var difficultyLevel: DifficultyLevel?
    
    var body: some View {
        VStack {
            Spacer()
            TitleView()
            Spacer()
            BoardView(gameType: $gameType, difficultyLevel: $difficultyLevel)
            Spacer()
            ConnectView()
            Spacer()
        }
        .padding()
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
