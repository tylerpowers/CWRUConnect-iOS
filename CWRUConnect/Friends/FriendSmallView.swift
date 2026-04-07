//
//  FriendSmallView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct FriendSmallView: View {
    @State var friend: User
    var body: some View {
        HStack {
//            if let friend_img = friend.image_link {
//                Image(friend_img)
//                    .resizable()
//                    .clipShape(Circle())
//                    .frame(width: 100, height: 100)
//                    .padding()
//            }
            Image(systemName: "person")
            Spacer()
            VStack {
                Text(friend.nickname)
                    .font(.title)
                Text(friend.minibio)
            }
        }
        .padding()
    }
}

#Preview {
//    FriendSmallView(
//        friend: .constant(Friend(name: "Alan S.", email: "ams2299@case.edu", headline: "Computer Science", bio: "", image: "cat"))
//    )
}
