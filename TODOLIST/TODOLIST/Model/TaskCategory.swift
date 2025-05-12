//
//  TaskCategory.swift
//  TODOLIST
//
//  Created by 袁钟盈 on 2025/5/12.
//

import SwiftUI

enum Category: String,CaseIterable{
    case general = "General"
    case bug = "Bug"
    case idea = "Idea"
    case modifiers = "Modifiers"
    case challenge = "Challenge"
    case coding = "Coding"
    
    var color: Color{
        switch self {
        case .general:
            return Color("Gray")
        case .bug:
            return Color("Green")
        case .idea:
            return Color("Pink")
        case .modifiers:
            return Color("Blue")
        case .challenge:
            return Color.purple
        case .coding:
            return Color.brown
        }
    }
}
