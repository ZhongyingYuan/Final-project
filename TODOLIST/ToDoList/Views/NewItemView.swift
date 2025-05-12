//
//  NewItemView.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    //private variable for colour 
    @State private var color : Color = .blue
//private variable for days
    @State private var days: [Date] = []
    var body: some View {
        VStack {
            Text("New Item").font(.custom("Hirangino Sans", size: 30)).bold().padding()
            Form {
                //Textfield
                TextField("Title", text: $viewModel.title ).textFieldStyle(DefaultTextFieldStyle())
                
                //to select a Due Date using datePicker
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                //Button to save
                TLButton(title: "Save", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
                
            } //error message to alert user if something went wrong
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill in all the fields and select due date"))
            }

        }
    }
}


#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in 
        
    }))
}
