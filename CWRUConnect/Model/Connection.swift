//
//  Connection.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/12/26.
//

struct Connection: Codable {
    let userid: Int?
    let targetid: Int?
}

struct ConnectionResponse: Codable {
    let status: String?
    let points_earned: Int?
}
