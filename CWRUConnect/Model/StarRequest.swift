//
//  StarRequest.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/13/26.
//

struct StarRequest: Codable {
    let userid: Int?
    let friendid: Int?
}

struct StarRequestResponse: Codable {
    let status: String?
}
