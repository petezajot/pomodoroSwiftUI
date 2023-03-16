//
//  MenuButton.swift
//  pomodoreSG
//
//  Created by MacBook Air on 09/03/23.
//

import SwiftUI

struct MenuButton: View {
    var image: String
    var title: String
    var action: (() -> Void)
    
    var body: some View {
        Button(action: { action() }) {
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                Text(title)
                    .foregroundColor(Constants.Colors.textIconsColor)
                    .font(Constants.Fonts.tinyFont)
            }.padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Constants.Colors.accentColor)
                .shadow(color: Constants.Colors.primaryText, radius: 2, x: 0, y: 2)
        )
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(image: "menu", title: "menu", action: {})
    }
}
