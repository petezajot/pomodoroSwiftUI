//
//  CustomButton.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var disabled: Bool = false
    var action: (() -> Void)
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(Constants.Fonts.tinyTitleFont)
                .foregroundColor(Constants.Colors.textIconsColor)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(disabled ? Constants.Colors.lightPrimaryColor : Constants.Colors.primaryColor)
                        .shadow(color: Constants.Colors.primaryText, radius: 2, x: 0, y: 2)
                )
        }
        .padding()
        .disabled(disabled)
        
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Botón", action: {})
    }
}
