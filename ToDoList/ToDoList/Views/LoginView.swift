//
//  LoginView.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List", subtitle:"Get things done", angle: 15, background: .pink)
                    
                //Login Form

                Form {
                    if  !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .font(.custom("Hiragino Sans", size: 15))
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .font(.custom("Hiragino Sans", size: 15))
                    
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }.font(.custom("Hiragino Sans", size: 15))
                    .padding()
                
                }
                .offset(y: -50)
                
                //Create Account
                VStack{
                    Text("New around here?").font(.custom("Hiragino Sans", size: 15))
                    
                    NavigationLink("Create an Account", destination: RegisterView())
                }.font(.custom("Hiragino Sans", size: 16))
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}

