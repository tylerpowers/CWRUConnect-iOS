//
//  FriendsView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct FriendsView: View {
    @State var fetching: Bool = false
    private let usersModel = UsersModel()
    
    func loadFriends() {
        fetching = true
        Task {
            await usersModel.refresh()
            fetching = false
        }
    }
    
    var body: some View {
        NavigationStack {
            if fetching {
                ProgressView()
            }
            else {
                if let friendList = usersModel.users {
                    NavigationStack {
                        List(friendList, id: \.self) { friend in
                            NavigationLink {
                                FriendLargeView(friend: friend)
                            } label: {
                                FriendSmallView(friend: friend)
                            }
                        }
                    }
                }
                else {
                    ContentUnavailableView("Sorry, we couldn't fetch friends.", systemImage: "mappin.slash.circle")
                        .onAppear() {
                            loadFriends()
                        }
                }
            }
        }
    }
}

#Preview {
    FriendsView()
}
