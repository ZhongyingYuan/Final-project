//
//  NewItemView.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//edited by Grace

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    
    @State private var color : Color = .blue
    @State private var date = Date.now
    let daysOfTheWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    //let days = 1..<32
    @State private var days: [Date] = []
    var body: some View {
        VStack {
            Text("New Item").font(.system(size: 32)).bold().padding()
            Form {
                //Textfield
                TextField("Title", text: $viewModel.title ).textFieldStyle(DefaultTextFieldStyle())
                
                LabeledContent("Calendar colour") {
                    ColorPicker("", selection: $viewModel.color, supportsOpacity: false)
                }
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                
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
