//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import SwiftUI
import Foundation

struct ToDoListItemView: View {
    @ObservedObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .bold()
                Text(Date(timeIntervalSince1970: item.dueDate)
                    .formatted(date: .abbreviated, time: .shortened))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsCompleted(item: item)
            } label: {
                Image(systemName: item.isCompleted ?
                      "checkmark.circle.fill" : "circle" )
            }
        }
    }
}
