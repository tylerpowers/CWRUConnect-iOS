//
//  RailwayModel.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/6/26.
//

import Foundation

private let urlString = "https://cwruconnect-api-production.up.railway.app/"

@Observable
class RailwayModel {
    var users: Users?
    
    func refresh() async {
        self.users = await getUsers()
    }
    
    func getUsers() async -> Users? {
        let session = URLSession(configuration: .default)
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            do {
                let (data, _) = try await session.data(for: request)
                let decoder = JSONDecoder()
                let locations = try decoder.decode(Users.self, from: data)
                return locations
            }
            catch {
                print("Error: \(error)")
            }
        }
        return nil
    }
    
}
