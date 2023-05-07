//
//  SettingsTextView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 7.5.23..
//

import SwiftUI

struct SettingsTextView: View {
    var text: String
    var font: Font
    
    var body: some View {
        Text(text.uppercased())
            .font(font)
            .bold()
            .padding(.bottom, 35)
    }
}

struct SettingsTextView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTextView(text: "Text goes here", font: .headline)
    }
}
