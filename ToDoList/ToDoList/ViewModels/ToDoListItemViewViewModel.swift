//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    init() {}

    func toggleIsCompleted(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.toggleCompleted(!item.isCompleted)
        guard Auth.auth().currentUser?.uid != nil else {
            return
        }
    
        let db = Firestore.firestore()
        _ = db.collection("users")
            .document("userid")
            .collection("todos")
            .document(itemCopy.id)
            .setData(from: itemCopy)
        }
    }
