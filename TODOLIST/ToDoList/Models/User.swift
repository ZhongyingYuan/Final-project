//
//  User.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
