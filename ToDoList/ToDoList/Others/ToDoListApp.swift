//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
