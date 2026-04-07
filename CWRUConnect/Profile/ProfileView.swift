//
//  ProfileView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct ProfileView: View {
    @Binding var userProfile: Friend  // likely to change later.
    var body: some View {
        NavigationStack {
            VStack {
                Image(userProfile.image!)
                    .resizable()
                Text(userProfile.name)
                Text(userProfile.headline)
                Text(userProfile.bio)
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                NavigationLink(destination: EditProfileView(userProfile: $userProfile)) {
                    Text("Edit Profile")
                }
            }
        }
    }
}

#Preview {
    ProfileView(userProfile: .constant(Friend(name: "Spartie Junior",
                                    email: "spart.jr@case.edu",
                                    headline: "Just happy to be here!",
                                    bio: "Hey! I'm Spartie Junior, but all of my friends call me Spart or Sparto. I'm so excited to be here at Case! I'm a Cleveland native (Go Browns!) and have wanted to come here ever since I was a kid.",
                                    image: "cat"))
    )
}
