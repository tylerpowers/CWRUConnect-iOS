//
//  FriendsView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import SwiftUI
import CodeScanner
internal import AVFoundation

struct FriendsView: View {
    @State var fetching: Bool = false
    @State var isScanning: Bool = false
    let usersModel = UsersModel()
    
    func loadFriends() {
        fetching = true
        Task {
            await usersModel.refresh()
            fetching = false
        }
    }
    
    func initiateConnection(_ newid: Int) {
        Task {
            await usersModel.addConnection(newid: newid)
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isScanning = false
        
        switch result {
        case .success(let result):
            let details = result.string
            print("Scanned: \(details)")
            initiateConnection(Int(result.string)!)
            loadFriends()
        case .failure:
            print("Scanning failed")
        }
    }
    
    var body: some View {
        if fetching {
            ProgressView()
        }
        else {
            if let friendList = usersModel.users {
                NavigationStack {
                    List(friendList, id: \.self) { friend in
                        NavigationLink {
                            FriendLargeView(friend: friend, usersModel: usersModel)
                        } label: {
                            FriendSmallView(friend: friend)
                        }
                    }
                    .refreshable {
                        loadFriends()
                    }
                    .toolbar {
                        Button {
                            isScanning = true
//                            NavigationLink {
//                                AddConnectionView(usersModel: usersModel)
//                            } label: {
//                                Image(systemName: "plus")
//                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    .sheet(isPresented: $isScanning) {
                        CodeScannerView(codeTypes: [.qr], simulatedData: "8", completion: handleScan)
                    }
                }
            }
            else {
                ContentUnavailableView("Sorry, we couldn't fetch friends.", systemImage: "mappin.slash.circle")
                    .onAppear() {
                        loadFriends()
                    }
            }
        }
    }
}

//#Preview {
//    FriendsView()
//}
