//
//  GameSelectionView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/16/26.
//

import SwiftUI

struct GameSelectionView: View {
    @State var cardNumber = 0
    @State var flashScore = 0
    @State var gameModel = GameModel()
    @State var path = NavigationPath()
    
    func refreshDeck() { Task { await gameModel.refresh() }}
    
    var body: some View {
        NavigationStack(path: $path) {
            HStack {
                Text("Learn")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding()
            List {
                NavigationLink(destination: FlashCardView(cardNumber: $cardNumber, gameModel: $gameModel, score: $flashScore, path: $path)) {
                    Text("Flash Cards")
                        .padding()
                }
                NavigationLink(destination: RecommendationsView()) {
                    Text("Weekly Recommendations")
                        .padding()
                }
            }
        }
        .onAppear {
            refreshDeck()
        }
    }
}

#Preview {
    GameSelectionView()
}
