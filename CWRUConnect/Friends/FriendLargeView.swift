//
//  FriendSmallView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct FriendLargeView: View {
    @Environment(\.dismiss) private var dismiss
    @State var friend: Friend
    @State var starred: Bool = false
    var usersModel: UsersModel
    
    func removeFriend() {
        Task {
            await usersModel.removeConnection(newid: friend.userid)
            await usersModel.refresh()
            dismiss()
        }
    }
    
    func star() {
        Task {
            await usersModel.star(newid: friend.userid)
            await usersModel.refresh()
            starred.toggle()
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if let good_link  = friend.image_link {
                    AsyncImage(url: URL(string: good_link)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                else {
                    Image(systemName: "person.fill")
                        .frame(width: 200, height: 200)
                }
                
                Text(friend.nickname)
                    .font(.largeTitle)
                Text("Pronunciation: \(friend.pronunciation ?? friend.nickname)")
                    .font(.caption)
                    .italic()
                Text(friend.minibio ?? "")
                HStack {
                    Text(friend.pronouns ?? "")
                    Spacer()
                    Text("MAJOR")
                    Spacer()
                    if let year = friend.graduation_year {
                        Text(year.description)
                    }
                    
                }
                .padding()
                HStack {
                    Text(friend.hometown ?? "")
                    Spacer()
                    Text(friend.nationality ?? "")
                }
                .padding()
                Button("Remove Connection") {
                    removeFriend()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    star()
                } label: {
                    Image(systemName: starred ? "star.fill" : "star")
                        .foregroundStyle(.yellow)
                }
            }
        }
        .onAppear {
            
            starred = friend.starred!
        }
    }
}

//#Preview {
//    FriendLargeView(    )
//}
