//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import SwiftUI
import Foundation

struct ToDoListItemView: View {
    //@ObservedObject var viewModel = ToDoListItemViewViewModel()
    @StateObject var viewModel = ProfileViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
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

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(
            id: "123", title: "Get mulk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isCompleted: true
        ))
    }
}
