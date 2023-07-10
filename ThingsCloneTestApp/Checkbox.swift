//
//  Checkbox.swift
//  ThingsCloneTestApp
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct Checkbox: View {
    @Binding var isComplete: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                isComplete.toggle()
            }
        }, label: {
            Image(systemName: isComplete ? "checkmark.square.fill" : "square")
                .imageScale(.large)
                .foregroundColor(isComplete ? .accentColor : .gray)
        })
    }
}
struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Checkbox(isComplete: .constant(false))
            Checkbox(isComplete: .constant(true))
        }
    }
}
