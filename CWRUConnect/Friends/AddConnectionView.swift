//
//  AddConnectionView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/12/26.
//

import SwiftUI

struct AddConnectionView: View {
    @State var newConnection: String = ""
    var usersModel: UsersModel
    var body: some View {
        Text("Enter user ID")
        TextField("ID", text: $newConnection)
        Button("Submit") {
            
        }
    }
}

//#Preview {
//    AddConnectionView()
//}
