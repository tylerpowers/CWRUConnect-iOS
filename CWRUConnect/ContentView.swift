//
//  ContentView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        @State var userProfile: Friend = Friend(name: "Spartie Junior",
                                                email: "spart.jr@case.edu",
                                                headline: "Just happy to be here!",
                                                bio: "Hey! I'm Spartie Junior, but all of my friends call me Spart or Sparto. I'm so excited to be here at Case! I'm a Cleveland native (Go Browns!) and have wanted to come here ever since I was a kid.",
                                                image: "cat")
        TabView {
            Tab("Friends", systemImage: "figure.wave") {
                FriendsView()
            }
            Tab("Profile", systemImage: "person.fill") {
                ProfileView(userProfile: $userProfile)
            }
            Tab("Learn", systemImage: "inset.filled.topleft.rectangle.portrait") {
                ContentUnavailableView("Coming Soon!", systemImage: "inset.filled.topleft.rectangle.portrait")
            }
        }
    }
}

#Preview {
    ContentView()
}
