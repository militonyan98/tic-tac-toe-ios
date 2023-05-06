//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 16.4.23..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                TitleView()
                    .foregroundColor(.red)
                Spacer()
                GameSettingsView()
                Spacer()
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
