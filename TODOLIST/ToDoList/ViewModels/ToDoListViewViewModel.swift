//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
  
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
// delete to do list items
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete(completion: nil)
    }
}
