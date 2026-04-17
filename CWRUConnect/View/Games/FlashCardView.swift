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
    @Binding var score: Int
    @Binding var path: NavigationPath
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State var answer_colors = [Color.blue, Color.blue, Color.blue, Color.blue]
    @State var correct_selected = false
    @State var is_first_guess = true
    
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
                        ForEach(0..<deck[cardNumber].choices.count) { choice in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 180, height: 50)
                                    .foregroundStyle(answer_colors[choice])
                                Text(deck[cardNumber].choices[choice])
                                    .foregroundStyle(.white)
                            }
                            .onTapGesture {
                                withAnimation {
                                    if deck[cardNumber].choices[choice] == deck[cardNumber].name {
                                        answer_colors[choice] = Color.green
                                        if is_first_guess { score = score + 1 }
                                        correct_selected = true
                                    }
                                    else {
                                        answer_colors[choice] = Color.red
                                        is_first_guess = false
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    
                    if correct_selected {
                        if !isEnd() {
                            Text("Next >")
                                .foregroundStyle(.blue)
                                .padding()
                                .onTapGesture {
                                    cardNumber = cardNumber + 1
                                    answer_colors = [Color.blue, Color.blue, Color.blue, Color.blue]
                                    is_first_guess = true
                                    correct_selected = false
                                }
                        }
                        else {
                            GameOverView(score: $score, gameModel: $gameModel, path: $path)
                                .padding()
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
