//
//  ContentView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Friends", systemImage: "figure.wave") {
                FriendsView()
            }
            Tab("Profile", systemImage: "person.fill") {
                ProfileView()
            }
            Tab("Learn", systemImage: "inset.filled.topleft.rectangle.portrait") {
                GameSelectionView()            }
        }
        .onAppear {
            UserDefaults.standard.set(8, forKey: "userid")
        }
    }
}

#Preview {
    ContentView()
}
