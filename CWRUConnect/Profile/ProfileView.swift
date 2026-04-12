//
//  ProfileView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct ProfileView: View {
    @State var fetching: Bool = false
    let profileModel = ProfileModel()
    
    func reloadProfile() {
        fetching = true
        Task {
            await profileModel.refresh()
            fetching = false
        }
    }
    
    var body: some View {
        NavigationStack {
            if fetching {
                ProgressView()
            }
            else {
                if let profile = profileModel.profile {
                    VStack {
                        PFPView(image_link: profile.image_link)
                        Text(profile.nickname)
                            .font(.largeTitle)
                        Text(profile.name)
                        Text("\(profile.caseid)@case.edu")
                        Text("Pronunciation: \(profile.pronunciation ?? "no pronunciation set.")")
                            .font(.caption)
                            .italic()
                        Text(profile.minibio ?? "")
                        Text("Your fun fact: \(profile.fact ?? "no fun fact set.")")
                        HStack {
                            Text(profile.pronouns ?? "")
                            Spacer()
                            Text("MAJOR")
                            Spacer()
                            Text(profile.graduation_year?.description ?? "")
                        }
                        .padding()
                        HStack {
                            Text(profile.hometown ?? "")
                            Spacer()
                            Text(profile.nationality ?? "")
                        }
                        .padding()
                    }
                }
                else {
                    ContentUnavailableView("Sorry, we couldn't fetch profile.", systemImage: "mappin.slash.circle")
                        .onAppear() {
                            reloadProfile()
                        }
                }
            }
        }
    }
}


//#Preview {
//    ProfileView()
//}
