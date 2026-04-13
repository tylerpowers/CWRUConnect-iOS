//
//  AddConnectionView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/12/26.
//

import SwiftUI



struct AddConnectionView: View {
    @Environment(\.dismiss) private var dismiss
    @State var newConnection: String = ""
    var usersModel: UsersModel
    
    func initiateConnection() {
        Task {
            await usersModel.addConnection(newid: Int(newConnection)!)
            newConnection = ""
            await usersModel.refresh()
            dismiss()
        }
    }
    
    var body: some View {
        Text("Enter user ID")
            .padding()
        TextField("ID", text: $newConnection)
            .keyboardType(.numberPad)
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
