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
                
                Text(friend.name)
                    .font(.largeTitle)
                Text("Pronunciation: \(friend.pronunciation ?? friend.nickname)")
                    .font(.caption)
                    .italic()
                List {
                    VStack {
                        HStack {
                            Text("About \(friend.name):")
                                .foregroundStyle(.gray)
                                .font(.subheadline)
                                .italic()
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Text(friend.minibio ?? "")
                                .lineLimit(4, reservesSpace: true)
                                .padding()
                            
                            Spacer()
                        }
                        Spacer()
                    }
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    VStack {
                        HStack {
                            Text("Fun fact:")
                                .foregroundStyle(.gray)
                                .font(.subheadline)
                                .italic()
                            Spacer()
                        }
                        .padding()
                        HStack {
                            Text(friend.fact ?? "no fun fact set.")
                                .padding()
                            Spacer()
                        }
                        Spacer()
                    }
                    .background(.accent.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    VStack {
                        HStack {
                            Text("Personal details:")
                                .foregroundStyle(.gray)
                                .font(.subheadline)
                                .italic()
                            Spacer()
                        }
                        .padding()
                        HStack {
                            Text("Pronouns: \(friend.pronouns ?? "not set")")
                            Spacer()
                        }
                        .padding()
                        HStack {
                            Text("Hometown: \(friend.hometown ?? "not set")")
                            Spacer()
                        }
                        .padding()
                        HStack {
                            Text("Nationality: \(friend.nationality ?? "not set")")
                            Spacer()
                        }
                        .padding()
                        HStack {
                            Text("Major: MAJOR")
                            Spacer()
                            Text("Grad. year: \(friend.graduation_year?.description ?? "not set")")
                        }
                        .padding()
                    }
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                Button("Remove Connection") {
                    removeFriend()
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .foregroundStyle(.white)
                .padding()
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
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
