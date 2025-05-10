//
//  HeaderView.swift
//  ToDoList
//
//  Created by 袁钟盈 on 2025/5/4.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
               
            VStack {
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    //.font(.system(size:50))
                    .font(.custom("Hiragino Sans", size: 50))
                
                Text(subtitle)
                    .foregroundColor(Color.white)
                    //.font(.system(size:30))
                    .font(.custom("Hiragino Sans", size: 30))
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
    }
}

