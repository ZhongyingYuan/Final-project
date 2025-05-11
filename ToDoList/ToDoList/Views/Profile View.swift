//
//  Profile View.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View{
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    // avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    // user name and email
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .padding()
                    }
                    .padding()
                    
                    
                    // sign out
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    tint(.red)
                        .padding()
                    
                    Spacer()
                    
                } else {
                    Text("Loading Profile...")
                }
            }
            navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
