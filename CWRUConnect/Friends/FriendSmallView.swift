//
//  FriendSmallView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI

struct FriendSmallView: View {
    
    func getDate(fromDate: String) -> String {
            
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS"
        let date = formatter.date(from: fromDate) ?? Date()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
            
        return formatter.string(from: date)
        }
    
    @State var friend: Friend
    var body: some View {
        HStack {
            if let good_link  = friend.image_link {
                AsyncImage(url: URL(string: good_link)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            else {
                Image(systemName: "person.fill")
                    .frame(width: 100, height: 100)
            }
            VStack {
                HStack {
                    Text(friend.nickname)
                        .font(.title)
                    Spacer()
                }
                HStack {
                    if let date = friend.matched_at {
                        Text("Connected on \(getDate(fromDate: date).description)")
                            .font(.caption)
                    }
                    Spacer()
                }
            }
            Spacer()
            if let starred = friend.starred {
                Image(systemName: starred ? "star.fill" : "star")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    FriendSmallView(
        friend: Friend(userid: 999, name: "Alan Slice", nickname: "Alan S.", caseid: "axs999", pronouns: "he/him", graduation_year: 2029, hometown: "Kentucky, AL", nationality: "American", image_link: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpeople.com%2Fthmb%2FLdqcEIO-al1_9Rxm6u_lSpgSHek%3D%2F2000x1417%2Ffilters%3Afill(auto%2C1)%2Fcam-newton-2000-022cc4221f514ecf85012a3598e6faea.jpg&f=1&nofb=1&ipt=93528b5a5db43c4e84c597fa5befb3e201341f3fe7beae45e7a8d71cade69385", pronunciation: "Al-uhn S.", minibio: "I'm Alan, I love skating and haunting!", fact: "I haunt...", is_public_leaderboard: true, note: "bestie", starred: false, matched_at: "Location of")
    )
}
