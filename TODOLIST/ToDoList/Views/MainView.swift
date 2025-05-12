 //
//  ContentView.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        }
        else {
                LoginView()
            }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Proflie", systemImage: "person.circle")
                }
            CalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "house")
                }
            
        }
    }

    }



#Preview {
    MainView()
}
