//
//  User.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/5/26.
//

import Foundation

struct Users: Codable {
    var users: [User]
}

struct User: Codable, Hashable {
    var userid: Int
    var name: String
    var nickname: String
    var caseid: String
    var pronouns: String
    var graduation_year: Int
    var hometown: String
    var nationality: String
    var image_link: String
    var pronunciation: String
    var minibio: String
    var fact: String
    var is_public_leaderboard: Bool
    var note: String
    var starred: Bool
    var matched_at: String
}
