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
    
    func addConnection(newID: Int) async -> Void {
        let userid = UserDefaults.standard.integer(forKey: "userid")
        guard let url = URL(string: "\(urlString)add_connection") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let body = Connection(userid: userid, targetid: newID)
        
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            print("Body encoding error: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("DataTask error: \(error)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status: \(httpResponse.statusCode)")
            }
            
            guard let data = data else {
                print("Error: no data")
                return
            }
            
            if data.isEmpty {
                print("Error: empty data")
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(ConnectionResponse.self, from: data)
                print("Success: \(decoded)")
            } catch {
                print("Failure: \(error)")
            }
            
        }.resume()
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
