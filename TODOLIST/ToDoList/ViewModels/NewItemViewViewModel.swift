//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        //get Userid
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        //create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isCompleted: false
        )
        //saveModel
        let db = Firestore.firestore()
        db.collection("users")
                  .document(uId)
                  .collection("todos")
                  .document(newId) // Also changed "123" to newId to use the UUID
                  .setData(newItem.asDictionary(), merge: false) { error in
                      if let error = error {
                          print("Error setting item data: \(error)")
                      }
                  }
            
    }
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        //ensure that the due date is greater than or equal to yesterday (taking in the current date and subtracting 24hours)
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
    
}
