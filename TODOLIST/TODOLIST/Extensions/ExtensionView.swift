//
//  ExtensionView.swift
//  TODOLIST
//
//  Created by grace cen on 12/5/2025.
//

import Foundation
import SwiftUICore

extension View {
    func hAlign(_ alignment: Alignment)->some View{
        self
            .frame(maxWidth: .infinity,alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment)->some View{
        self
            .frame(maxHeight: .infinity,alignment: alignment)
    }
}
