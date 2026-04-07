//
//  RailwayModel.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/6/26.
//

import Foundation

private let urlString = "https://7hsxg16oej.execute-api.us-east-2.amazonaws.com/get_connections/2"

@Observable
class UsersModel {
    var users: [User]?
    
    func refresh() async {
        self.users = await getUsers()
    }
    
    func getUsers() async -> [User]? {
        let session = URLSession(configuration: .default)
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            do {
                let (data, _) = try await session.data(for: request)
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: data)
                return users
            }
            catch {
                print("Error: \(error)")
            }
        }
        return nil
    }
}
