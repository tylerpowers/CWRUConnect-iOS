//
//  Game.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/16/26.
//

struct FlashCard: Codable {
    var userid: Int
    var name: String
    var image_link: String
    var score: Int
    var choices: [String]
}
