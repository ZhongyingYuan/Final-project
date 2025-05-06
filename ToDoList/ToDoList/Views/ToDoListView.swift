//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//edited by Grace

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    private let userId : String
    init(userId : String ) {
        self.userId = userId
    }
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName:"plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
