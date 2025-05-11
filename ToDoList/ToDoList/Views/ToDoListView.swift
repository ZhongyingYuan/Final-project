//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//edited by Grace

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreCombineSwift
import FirebaseFirestore


struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
            
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                            } label: {
                                Button("Delete") {
                                    viewModel.delete(id: item.id)
                                }
                                .tint(Color.red)
                                
                            }
                        }
                        .listStyle(PlainListStyle())
                    
                }
                .navigationTitle("To Do List")
                .toolbar {
                    Button {
                        //Action, showing all thec new items
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName:"plus")
                    }
                } // show the items using sheet
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
            }
        }
    }
    
    #Preview {
        ToDoListView(userId: "")
    }
