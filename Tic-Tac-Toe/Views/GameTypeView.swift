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
    @State private var twoPlayerButtonTapped = false
    @State private var aiButtonTapped = false
    
    var body: some View {
        VStack {
            Text("Choose game type".uppercased())
                .font(.title3)
                .bold()
                .padding(.bottom, 35)
            
            HStack {
                NavigationLink(destination: GameView(gameType: .twoPlayer, difficultyLevel: $difficultyLevel), tag: 1, selection: $action) {
                    EmptyView()
                }
                
                Spacer()
                
                Text("2 Player")
                    .onTapGesture {
                        action = 1
                        twoPlayerButtonTapped = true
                        aiButtonTapped = false
                    }
                    .frame(width: 80, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(twoPlayerButtonTapped ? .red : .secondary.opacity(0.3)))
                
                
                Spacer()
                
                Text("AI")
                    .onTapGesture {
                        action = 2
                        aiButtonTapped = true
                        twoPlayerButtonTapped = false
                    }
                    .frame(width: 80, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(aiButtonTapped ? .red : .secondary.opacity(0.3)))
                
                Spacer()
            }
        }
    }
}

//struct GameTypeView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameTypeView()
//    }
//}
