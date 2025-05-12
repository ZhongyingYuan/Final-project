//
//  ContentView.swift
//  TODOLIST
//
//  Created by 袁钟盈 on 2025/5/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
            .preferredColorScheme(.light)
    }
}
//struct ContentView: View {
//    @State private var selectedTab = 0
//    @State private var tasks: [Task] = sampleTasks
//    @State private var addNewTask: Bool = false
//    
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            // Timeline View Tab
//            Home()
//                .tabItem {
//                    Label("Timeline", systemImage: "clock")
//                }
//                .tag(0)
//            
//            // Calendar View Tab
//            CalendarView(tasks: $tasks)
//                .tabItem {
//                    Label("Calendar", systemImage: "calendar")
//                }
//                .tag(1)
//        }
//        .fullScreenCover(isPresented: $addNewTask) {
//            AddTaskView { task in
//                tasks.append(task)
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
