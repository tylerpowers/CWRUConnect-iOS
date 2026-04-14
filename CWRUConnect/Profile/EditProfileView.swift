//
//  EditProfileView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State var user: User?
    @State var changedUser: UserChangeRequest = UserChangeRequest(
        userid: -1, 
        name: "",
        nickname: "",
        pronouns: "",
        hometown: "",
        nationality: "",
        pronunciation: "",
        minibio: "",
        fact: "",
        is_public_leaderboard: false
    )

    @State var newName = ""
    @State var newNickname = ""
    @State var newPronouns = ""
    @State var newHometown = ""
    @State var newNationality = ""
    @State var newPronunciation = ""
    @State var newMinibio = ""
    @State var newFact = ""
    @State var newPublicLeaderboard = true
    var profileModel: ProfileModel
    
    func saveChanges() {
        Task {
            await profileModel.updateUser(user: changedUser)
            await profileModel.refresh()
        }
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $changedUser.name)
            TextField("Nickname", text: $changedUser.nickname)
            TextField("Pronouns", text: $changedUser.pronouns)
            TextField("Hometown", text: $changedUser.hometown)
            TextField("Nationality", text: $changedUser.nationality)
            TextField("Pronunciation", text: $changedUser.pronunciation)
            TextField("Bio", text: $changedUser.minibio, axis: .vertical)
                .lineLimit(4, reservesSpace: true)
            TextField("Fact", text: $changedUser.fact)
            Toggle("Display on Public Leaderboard", isOn: $changedUser.is_public_leaderboard)
            Button("Save Changes") {
                saveChanges()
                dismiss()
            }
        }
        .onAppear {
            user = profileModel.profile
            guard let user else { return }
            changedUser = UserChangeRequest(
                userid: user.userid,
                name: user.name,
                nickname: user.nickname,
                pronouns: user.pronouns ?? "",
                hometown: user.hometown ?? "",
                nationality: user.nationality ?? "",
                pronunciation: user.pronunciation ?? "",
                minibio: user.minibio ?? "",
                fact: user.fact ?? "",
                is_public_leaderboard: user.is_public_leaderboard ?? true
                )
            
        }
    }
}

//#Preview {
//
//}
