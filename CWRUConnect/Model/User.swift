//
//  User.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/11/26.
//

import Foundation

struct User: Codable {
    var userid: Int
    var name: String
    var nickname: String
    var caseid: String
    var email: String?
    var pronouns: String?
    var graduation_year: Int?
    var hometown: String?
    var nationality: String?
    var image_link: String?
    var pronunciation: String?
    var minibio: String?
    var fact: String?
    var is_public_leaderboard: Bool?
    var match_points_all_time: Int?
    var study_points_all_time: Int?
    var created_at: Date?
}

struct UserChangeRequest: Codable {
    var userid: Int
    var name: String
    var nickname: String
    var pronouns: String
    var hometown: String
    var nationality: String
    var pronunciation: String
    var minibio: String
    var fact: String
    var is_public_leaderboard: Bool
}

struct UserChangeResponse: Codable {
    var success: Bool?
}
