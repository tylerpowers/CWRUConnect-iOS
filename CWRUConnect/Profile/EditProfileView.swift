//
//  EditProfileView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct EditProfileView: View {
    @Binding var userProfile: Friend
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form {
            Section(header: Text("Edit Profile")) {
                TextField("Name", text: $userProfile.name)
                Text(userProfile.email)
                TextField("Headline", text: $userProfile.headline)
                TextField("Bio", text: $userProfile.bio, axis: .vertical)
                    .lineLimit(10)
                Button("Done") {
                    dismiss()
                }
            }
        }
        .onDisappear {
            // update values
        }
    }
}

#Preview {
    EditProfileView(userProfile: .constant(Friend(name: "Spartie Junior",
                                                  email: "spart.jr@case.edu",
                                                  headline: "Just happy to be here!",
                                                  bio: "Hey! I'm Spartie Junior, but all of my friends call me Spart or Sparto. I'm so excited to be here at Case! I'm a Cleveland native (Go Browns!) and have wanted to come here ever since I was a kid.",
                                                  image: "cat"))
)
}
