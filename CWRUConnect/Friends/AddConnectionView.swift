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
    
    func initiateConnection() -> Bool {
        Task {
            await usersModel.addConnection(newID: Int(newConnection)!)
            newConnection = ""
            await usersModel.refresh()
            // dismiss
            return true
        }
        return false
    }
    
    var body: some View {
        Text("Enter user ID")
            .padding()
        TextField("ID", text: $newConnection)
//            .keyboardType(.numberPad)
            .padding()
        Button("Submit") {
            initiateConnection()
        }
        .padding()
    }
}

//#Preview {
//    AddConnectionView()
//}
