//
//  ProfileModel.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/16/26.
//

import Foundation

private let urlString = "https://7hsxg16oej.execute-api.us-east-2.amazonaws.com/"

@Observable
class ProfileModel {
    var profile: User?
    
    func refresh() async {
        self.profile = await getUser()
    }
    
    func getUser() async -> User? {
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
    
    func updateUser(user: UserChangeRequest) async -> Void {
        guard let url = URL(string: "\(urlString)update_user") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            print(user)
            request.httpBody = try JSONEncoder().encode(user)
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
                let decoded = try JSONDecoder().decode(UserChangeResponse.self, from: data)
                print("Success: \(decoded)")
            } catch {
                print("Failure: \(error)")
            }
            
        }.resume()
    }
    
}
