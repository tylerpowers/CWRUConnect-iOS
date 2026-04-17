//
//  GameOverView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/16/26.
//

import SwiftUI

struct GameOverView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var score: Int
    @Binding var gameModel: GameModel
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationStack {
            if let deck = gameModel.cardDeck {
                Text(score == deck.count ? "Good work!" : "Keep practicing!")
                    .font(.largeTitle)
                Text("Your Score: \(score)/\(deck.count)")
                    .italic()
                Text("< Exit")
                    .padding()
                    .foregroundStyle(.blue)
                    .onTapGesture {
                        dismiss()
                    }
            }
            else {
                Text("Error displaying score.")
            }
        }
    }
}

//#Preview {
//    GameOverView()
//}
