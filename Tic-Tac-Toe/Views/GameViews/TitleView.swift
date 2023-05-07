//
//  TitleView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 28.4.23..
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Tic Tac Toe")
            .font(.title)
            .bold()
        Text("By Hermine Militonyan")
            .font(.caption2)
            .foregroundColor(.secondary)
            .italic()
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
