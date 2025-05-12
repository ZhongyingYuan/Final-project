//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by grace cen on 11/5/2025.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
import FirebaseFirestoreInternal

class ProfileViewViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    
    func  fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                )
            }
            
        }
    }
    func toggleIsCompleted(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.toggleCompleted(!item.isCompleted)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
    
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary(), merge: false) { error in
                if let error = error {
                    print("Error setting item data: \(error)")
                }
            }
        }
    }
