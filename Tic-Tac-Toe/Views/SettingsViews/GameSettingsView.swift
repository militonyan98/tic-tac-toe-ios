//
//  GameSettingsView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 3.5.23..
//

import SwiftUI

struct GameSettingsView: View {
    @State private var action: Int? = 0
    
    var body: some View {
        GameTypeView(action: $action)
        
        if action == 2 {
            Spacer()
            GameDifficultyView()
        }
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView()
    }
}
