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
                ContentUnavailableView("Coming Soon!", systemImage: "inset.filled.topleft.rectangle.portrait")
            }
        }
        .onAppear {
            UserDefaults.standard.set(4, forKey: "userid")
        }
    }
}

#Preview {
    ContentView()
}
