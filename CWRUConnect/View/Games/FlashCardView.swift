//
//  FlashCardView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/16/26.
//

import SwiftUI

struct FlashCardView: View {
    @Binding var cardNumber: Int
    @Binding var gameModel: GameModel
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State var answer_color = Color.blue
    @State var correct_selected = false
    
    func isEnd() -> Bool {
        if gameModel.cardDeck?.count == cardNumber + 1 {
            return true
        }
        return false
    }
    
    var body: some View {
        if let deck = gameModel.cardDeck {
            NavigationStack {
                VStack {
                    Text("Who is this friend?")
                        .font(.largeTitle)
                    Spacer()
                    
                    AsyncImage(url: URL(string: deck[cardNumber].image_link)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    Spacer()
                    
                    LazyVGrid(columns: columns) {
                        ForEach(deck[cardNumber].choices, id: \.self) { choice in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 180, height: 50)
                                    .foregroundStyle(answer_color)
                                Text(choice)
                                    .foregroundStyle(.white)
                            }
                            .onTapGesture {
                                withAnimation {
                                    if choice == deck[cardNumber].name {
                                        answer_color = Color.green
                                        correct_selected = true
                                    }
                                    else {
                                        answer_color = Color.red
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    
                    if correct_selected {
                        if !isEnd() {
                            NavigationLink(destination: FlashCardView(cardNumber: .constant(cardNumber+1), gameModel: $gameModel)) {
                                Text("Next >")
                            }
                        }
                        else {
                            GameOverView()
                        }
                    }
                }
            }
        }
        else {
            Text("Error loading card deck.")
        }
    }
}

//#Preview {
//    FlashCardView()
//}
