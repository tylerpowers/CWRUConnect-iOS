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
            Section(header: Text("Identity")) {
                Text("\(userProfile.name) (\(userProfile.caseid))")
                    .bold()
                TextField("Nickname", text: $userProfile.nickname)
//                TextField("Pronouns", text: $userProfile.pronouns)
//                TextField("Pronunciation", text: $userProfile.pronunciation)
            }
            Section(header: Text("Personal Details")) {
                Picker("Graduation year", selection: $userProfile.graduation_year) {
                    ForEach(2025..<2030) {
                        Text("\($0)")
                    }
                }
//                TextField("Hometown", text: $userProfile.hometown)
//                TextField("Fun Fact", text: $userProfile.fact)
//                TextField("Enter Mini-Bio", text: $userProfile.minibio, axis: .vertical)
//                    .lineLimit(5, reservesSpace: true)
            }
        }
        .onDisappear {
            // update values
        }
    }
}

#Preview {
    EditProfileView(userProfile: .constant(Friend(userid: 999, name: "Alan Slice", nickname: "Alan S.", caseid: "axs999", pronouns: "he/him", graduation_year: 2029, hometown: "Kentucky, AL", nationality: "American", image_link: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpeople.com%2Fthmb%2FLdqcEIO-al1_9Rxm6u_lSpgSHek%3D%2F2000x1417%2Ffilters%3Afill(auto%2C1)%2Fcam-newton-2000-022cc4221f514ecf85012a3598e6faea.jpg&f=1&nofb=1&ipt=93528b5a5db43c4e84c597fa5befb3e201341f3fe7beae45e7a8d71cade69385", pronunciation: "Al-uhn S.", minibio: "I'm Alan, I love skating and haunting!", fact: "I haunt...", is_public_leaderboard: true, note: "bestie", starred: false, matched_at: "Location of")
        ))
}
