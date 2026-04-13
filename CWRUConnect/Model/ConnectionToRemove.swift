//
//  ConnectionToRemove.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/13/26.
//

struct ConnectionToRemove: Codable {
    let userid: Int?
    let friendid: Int?
}

struct ConnectionToRemoveResponse: Codable {
    let status: String?
}
