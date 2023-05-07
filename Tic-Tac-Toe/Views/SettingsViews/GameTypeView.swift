//
//  GameTypeView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 3.5.23..
//

import SwiftUI

struct GameTypeView: View {
    @Binding var action: Int?
    @State var difficultyLevel: DifficultyLevel?
    @State private var twoPlayerButtonTapped: Bool? = false
    @State private var aiButtonTapped: Bool? = false
    
    var body: some View {
        VStack {
            SettingsTextView(text: "Choose game type", font: .title3)
            
            HStack {
                NavigationLink(destination: GameView(gameType: .twoPlayer, difficultyLevel: $difficultyLevel), tag: 1, selection: $action) {
                    EmptyView()
                }
                Spacer()
                GameTypeButtonView(text: "2 Player", givenAction: 1, action: $action, twoPlayer: true, twoPlayerButtonTapped: $twoPlayerButtonTapped, aiButtonTapped: $aiButtonTapped)
                Spacer()
                GameTypeButtonView(text: "AI", givenAction: 2, action: $action, twoPlayerButtonTapped: $twoPlayerButtonTapped, ai: true, aiButtonTapped: $aiButtonTapped)
                Spacer()
            }
        }
        .navigationBarTitle("Main")
        .navigationBarHidden(true)
    }
}

//struct GameTypeView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameTypeView()
//    }
//}
