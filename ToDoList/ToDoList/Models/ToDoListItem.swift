//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//edited by Grace 

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isCompleted: Bool
    
    mutating func toggleCompleted(_ state: Bool) {
        isCompleted = state
    }
}

