//
//  GameTypeButtonView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 7.5.23..
//

import SwiftUI

struct GameTypeButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    var text: String
    var givenAction: Int
    @Binding var action: Int?
    var twoPlayer: Bool? = false
    @Binding var twoPlayerButtonTapped: Bool?
    var ai: Bool? = false
    @Binding var aiButtonTapped: Bool?
    
    var body: some View {
        Text(text)
            .onTapGesture {
                action = givenAction
                twoPlayerButtonTapped = twoPlayer
                aiButtonTapped = ai
            }
            .frame(width: 80, height: 50)
            .background(RoundedRectangle(cornerRadius: 10).fill((twoPlayerButtonTapped == twoPlayer && twoPlayer == true) || ((aiButtonTapped == ai && ai == true)) ? .red : colorScheme == .light ? .secondary.opacity(0.2) : .white.opacity(0.2)))
    }
}

//struct GameTypeButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameTypeButtonView()
//    }
//}
