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
                    NavigationStack {
                        VStack {
                            PFPView(image_link: profile.image_link)
                            Text(profile.name)
                                .font(.largeTitle)
                                .bold()
                            Text("Pronunciation: \(profile.pronunciation ?? "no pronunciation set.")")
                                .font(.caption)
                                .italic()
                            List {
                                VStack {
                                    HStack {
                                        Text("About me:")
                                            .foregroundStyle(.gray)
                                            .font(.subheadline)
                                            .italic()
                                            .padding()
                                        Spacer()
                                    }
                                    HStack {
                                        Text(profile.minibio ?? "")
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
                                        Text(profile.fact ?? "no fun fact set.")
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
                                        Text("Pronouns: \(profile.pronouns ?? "not set")")
                                        Spacer()
                                    }
                                    .padding()
                                    HStack {
                                        Text("Hometown: \(profile.hometown ?? "not set")")
                                        Spacer()
                                    }
                                    .padding()
                                    HStack {
                                        Text("Nationality: \(profile.nationality ?? "not set")")
                                        Spacer()
                                    }
                                    .padding()
                                    HStack {
//                                        Text("Major: MAJOR")
//                                        Spacer()
                                        Text("Grad. year: \(profile.graduation_year?.description ?? "not set")")
                                        Spacer()
                                    }
                                    .padding()
                                }
                                .background(.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                HStack {
                                    Text("Email (not shared):")
                                    Spacer()
                                    Text("\(profile.caseid)@case.edu")
                                        .foregroundStyle(.accent)
                                }
                            }
                            .listStyle(.plain)
                            .listRowSeparator(.hidden)
                        }
                        .padding()
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink("Edit") {
                                EditProfileView(profileModel: profileModel)
                                    .onDisappear {
                                        reloadProfile()
                                    }
                            }
                        }
                    }
                }
                else {
                    ContentUnavailableView("Sorry, we couldn't fetch profile.", systemImage: "mappin.slash.circle")
                        .onAppear() {
                            UserDefaults.standard.set(8, forKey: "userid")
                            reloadProfile()
                        }
                }
            }
        }
    }
}


#Preview {
    ProfileView()
}
