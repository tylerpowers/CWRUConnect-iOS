//
//  FriendSmallView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct FriendSmallView: View {
    @Binding var friend: Friend
    var body: some View {
        HStack {
            if let friend_img = friend.image {
                Image(friend_img)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .padding()
            }
            Spacer()
            VStack {
                Text(friend.name)
                    .font(.title)
                Text(friend.headline)
            }
        }
        .padding()
    }
}

#Preview {
    FriendSmallView(
        friend: .constant(Friend(name: "Alan S.", email: "ams2299@case.edu", headline: "Computer Science", bio: "", image: "cat"))
    )
}
