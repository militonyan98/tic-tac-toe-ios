//
//  DifficultyLevelButtonView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 7.5.23..
//

import SwiftUI

struct DifficultyLevelButtonView: View {
    var text: String
    var givenDifficultyLevel: DifficultyLevel
    @Binding var difficultyLevel: DifficultyLevel?
    @Binding var isActive: Bool
    
    var body: some View {
        Text(text)
            .onTapGesture {
                difficultyLevel = givenDifficultyLevel
                isActive = true
            }
            .frame(width: 80, height: 50)
            .background(RoundedRectangle(cornerRadius: 10).fill(difficultyLevel == givenDifficultyLevel ? .red : .secondary.opacity(0.2)))
    }
}

//struct DifficultyLevelButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        DifficultyLevelButtonView()
//    }
//}
