//
//  Friend.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 3/4/26.
//

import Foundation

struct Friend: Identifiable, Codable {
    var id = UUID()
    var name: String
    var email: String
    var headline: String
    var bio: String
    var image: String?
}
