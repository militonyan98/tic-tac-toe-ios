//
//  SquareView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 28.4.23..
//

import SwiftUI

struct SquareView: View {
    var value: Mark
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.red)
                .frame(width: 90, height: 90)
            
            value != .blank ? Image(systemName: value == .x ? "xmark" : "circle") : Image(systemName: "")
        }
        .padding(1)
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(value: .x)
    }
}
