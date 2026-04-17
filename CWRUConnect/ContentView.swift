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
            Tab("Learn", systemImage: "inset.filled.topleft.rectangle.portrait") {
                GameSelectionView()
            }
            Tab("Friends", systemImage: "figure.wave") {
                FriendsView()
            }
            Tab("Profile", systemImage: "person.fill") {
                ProfileView()
            }
        }
        .onAppear {
            UserDefaults.standard.set(8, forKey: "userid")
        }
    }
}

#Preview {
    ContentView()
}
