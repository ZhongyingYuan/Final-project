//
//  TLButton.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        }label:  {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

struct TLButton_Previewss: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Value", background: .pink) {
            //Action
        }
    }
}
