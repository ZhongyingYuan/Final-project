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
            //signed In
            ToDoListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
