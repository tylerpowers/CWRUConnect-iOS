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

struct User: Codable {
    var name: String?
    var nickname: String?
    var email: String?
    var pronouns: String?
    var pronunciation: String?
    var gradYear: Int?
    var hometown: String?
    var nationality: String?
    var primaryMajorID: Int?
    var secondaryMajorID: Int?
    var image: String?
    var biography: String?
    var fact: String?
}
