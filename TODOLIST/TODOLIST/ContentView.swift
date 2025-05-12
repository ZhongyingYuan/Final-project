//
//  ContentView.swift
//  TODOLIST
//
//  Created by 袁钟盈 on 2025/5/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
