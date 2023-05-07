//
//  GameDifficultyView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 3.5.23..
//

import SwiftUI

struct GameDifficultyView: View {
    @State private var difficultyLevel: DifficultyLevel? = nil
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            SettingsTextView(text: "Choose difficulty level", font: .headline)
            
            NavigationLink(destination: GameView(gameType: .ai, difficultyLevel: $difficultyLevel), isActive: $isActive) {
                EmptyView()
            }
            
            HStack {
                DifficultyLevelButtonView(text: "Easy", givenDifficultyLevel: .easy, difficultyLevel: $difficultyLevel, isActive: $isActive)
                DifficultyLevelButtonView(text: "Medium", givenDifficultyLevel: .medium, difficultyLevel: $difficultyLevel, isActive: $isActive)
                DifficultyLevelButtonView(text: "Hard", givenDifficultyLevel: .hard, difficultyLevel: $difficultyLevel, isActive: $isActive)
            }
        }
    }
}

struct GameDifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        GameDifficultyView()
    }
}
