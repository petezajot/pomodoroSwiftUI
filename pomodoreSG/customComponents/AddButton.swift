//
//  AddButton.swift
//  pomodoreSG
//
//  Created by MacBook Air on 08/03/23.
//

import SwiftUI

struct AddButton: View {
    var action: (() -> Void)
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image("menu")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Constants.Colors.primaryText)
        }
        .frame(width: 15, height: 15)
        .padding(.trailing, 10)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(action: {})
    }
}
