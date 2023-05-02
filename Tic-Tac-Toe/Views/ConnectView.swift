//
//  ConnectView.swift
//  Tic-Tac-Toe
//
//  Created by Hermine Militonyan on 28.4.23..
//

import SwiftUI

struct ConnectView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var githubLogo: String {
        colorScheme == .dark ? "github-mark-white" : "github-mark"
    }
    
    var body: some View {
        VStack {
            Text("Connect with me")
                .font(.caption)
            Link(destination: URL(string: "https://github.com/militonyan98")!) {
                Image(githubLogo)
                    .resizable()
                    .frame(width: 30,height: 30)
            }
        }
    }
}

struct ConnectView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectView()
    }
}
