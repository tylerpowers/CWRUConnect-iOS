//
//  FriendSmallView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct FriendLargeView: View {
    @State var friend: User
    var body: some View {
        VStack {
            FriendSmallView(friend: friend)
                .padding()
            Spacer()
            Text(friend.minibio)
                .padding()
            Spacer()
        }
    }
}

#Preview {
//    FriendLargeView(
//        friend: .constant(Friend(name: "Alan S.", email: "ams2299@case.edu", headline: "Computer Science", bio: "Hey! My name is Alan Slice! I'm originally from Maine, but spent most of my upbringing in the DMV area (Vienna, VA for the curious!). My hobbies include eating/making/talking about pizza, playing ukulele, and haunting people. HAHAHA! I am going to haunt you forever!", image: "cat"))
//    )
}
