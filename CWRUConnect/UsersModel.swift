//
//  RailwayModel.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/6/26.
//

import Foundation

private let urlString = "https://7hsxg16oej.execute-api.us-east-2.amazonaws.com/"

@Observable
class UsersModel {
    var users: [Friend]?
    
    func refresh() async {
        self.users = await getConnections()
    }
    
    func getConnections() async -> [Friend]? {
        let session = URLSession(configuration: .default)
        let userid = UserDefaults.standard.integer(forKey: "userid")
        if let url = URL(string: "\(urlString)get_connections/\(userid)") {
            let request = URLRequest(url: url)
            do {
                let (data, _) = try await session.data(for: request)
                let decoder = JSONDecoder()
                let users = try decoder.decode([Friend].self, from: data)
                return users
            }
            catch {
                print("Error: \(error)")
            }
        }
        return nil
    }
    
    func addConnection(newID: Int) async -> Bool {
        let session = URLSession(configuration: .default)
        let userid = UserDefaults.standard.integer(forKey: "userid")
        if let url = URL(string: "\(urlString)add_connection/\(userid)/") {}
        return false
    }
    
}

@Observable
class ProfileModel {
    var profile: User?
    
    func refresh() async {
        self.profile = await getUser()
    }
    
    func getUser() async -> User? {
        print(UserDefaults.standard.integer(forKey: "userid"))
        let session = URLSession(configuration: .default)
        let userid = UserDefaults.standard.integer(forKey: "userid")
        if let url = URL(string: "\(urlString)get_user_stats/\(userid)") {
            let request = URLRequest(url: url)
            do {
                let (data, _) = try await session.data(for: request)
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                return user
            }
            catch {
                print("Error: \(error)")
            }
        }
        return nil
    }
    
}
