//
//  CustomLinkButton.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import SwiftUI

struct CustomLinkButton: View {
    var title: String
    var action: (() -> Void)
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .underline()
                .font(Constants.Fonts.bigFont)
                .foregroundColor(Constants.Colors.primaryText)
        }
    }
}

struct CustomLinkButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomLinkButton(title: "Botón link", action: {})
    }
}
