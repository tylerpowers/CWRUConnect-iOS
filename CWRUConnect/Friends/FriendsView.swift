//
//  FriendsView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct FriendsView: View {
    @State var friends: [Friend] = [
        Friend(name: "Christian", email: "ams2299@case.edu", headline: "CS Student at CWRU", bio: "Hey! My name is Alan Slice! I'm originally from Maine, but spent most of my upbringing in the DMV area (Vienna, VA for the curious!). My hobbies include eating/making/talking about pizza, playing ukulele, and haunting people. HAHAHA! I am going to haunt you forever!", image: "cat"),
        Friend(name: "Alan S.", email: "llb11111@case.edu", headline: "Basketball Science", bio: "#1 on the Hornets. Best in the nation. Don't ask me about my driving ability.", image: "cat"),
        Friend(name: "Ben", email: "vxb77777@case.edu", headline: "Automotive Engineering", bio: "Catch me in my Cadillac...", image: "cat")
    ]
    
    var body: some View {
        NavigationStack {
            List($friends) { friend in
                NavigationLink {
                    FriendLargeView(friend: friend)
                } label: {
                    FriendSmallView(friend: friend)
                }
            }
        }
    }
}

#Preview {
    FriendsView()
}
