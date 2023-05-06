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
            Text("Choose difficulty level".uppercased())
                .font(.headline)
                .bold()
                .padding(.bottom, 35)
            
            NavigationLink(destination: GameView(gameType: .ai, difficultyLevel: $difficultyLevel), isActive: $isActive) {
                EmptyView()
            }
            
            HStack {
                
                Text("Easy")
                    .onTapGesture {
                        difficultyLevel = .easy
                        isActive = true
                    }
                    .frame(width: 80, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(difficultyLevel == .easy ? .red : .secondary.opacity(0.3)))

                Text("Medium")
                    .onTapGesture {
                        difficultyLevel = .medium
                        isActive = true
                    }
                    .frame(width: 80, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(difficultyLevel == .medium ? .red : .secondary.opacity(0.3)))

                Text("Hard")
                    .onTapGesture {
                        difficultyLevel = .hard
                        isActive = true
                    }
                    .frame(width: 80, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(difficultyLevel == .hard ? .red : .secondary.opacity(0.3)))
            }
        }
    }
}

struct GameDifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        GameDifficultyView()
    }
}
