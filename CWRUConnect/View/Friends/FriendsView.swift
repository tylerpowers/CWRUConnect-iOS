//
//  FriendsView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct FriendsView: View {
    @State var fetching: Bool = false
    let usersModel = UsersModel()
    
    func loadFriends() {
        fetching = true
        Task {
            await usersModel.refresh()
            fetching = false
        }
    }
    
    var body: some View {
        if fetching {
            ProgressView()
        }
        else {
            if let friendList = usersModel.users {
                NavigationStack {
                    List(friendList, id: \.self) { friend in
                        NavigationLink {
                            FriendLargeView(friend: friend, usersModel: usersModel)
                        } label: {
                            FriendSmallView(friend: friend)
                        }
                    }
                    .refreshable {
                        loadFriends()
                    }
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            NavigationLink {
                                AddConnectionView(usersModel: usersModel)
                            } label: {
                                Image(systemName: "plus")
                            }
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

//#Preview {
//    FriendsView()
//}
