//
//  GameSelectionView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/16/26.
//

import SwiftUI

struct GameSelectionView: View {
    @State var cardNumber = 0
    @State var gameModel = GameModel()
    
    func refreshDeck() { Task { await gameModel.refresh() }}
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: FlashCardView(cardNumber: $cardNumber, gameModel: $gameModel)) {
                Text("Flash Cards")
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
