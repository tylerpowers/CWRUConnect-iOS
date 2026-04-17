//
//  SwiftUIView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/8/26.
//

import SwiftUI

struct PFPView: View {
    let QR_URL = "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data="
    var image_link: String?
    @State var tapped = false
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "\(QR_URL)\(UserDefaults.standard.integer(forKey: "userid"))")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .rotation3DEffect(.degrees(tapped ? 0 : -90), axis: (x: 0, y: 1, z: 0))
            .animation(tapped ? .linear.delay(0.35) : .linear, value: tapped)
            
            if let good_link = image_link, !good_link.isEmpty {
                AsyncImage(url: URL(string: good_link)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .rotation3DEffect(.degrees(tapped ? 90 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(tapped ? .linear : .linear.delay(0.35), value: tapped)
            }
            else {
                Image(systemName: "person.crop.circle")
                .rotation3DEffect(.degrees(tapped ? 90 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(tapped ? .linear : .linear.delay(0.35), value: tapped)
            }
        }
        .frame(width: 200, height: 200)
        .onTapGesture {
            tapped.toggle()
        }
    }
}

#Preview {
    PFPView(image_link: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpeople.com%2Fthmb%2FLdqcEIO-al1_9Rxm6u_lSpgSHek%3D%2F2000x1417%2Ffilters%3Afill(auto%2C1)%2Fcam-newton-2000-022cc4221f514ecf85012a3598e6faea.jpg&f=1&nofb=1&ipt=93528b5a5db43c4e84c597fa5befb3e201341f3fe7beae45e7a8d71cade69385")
}
