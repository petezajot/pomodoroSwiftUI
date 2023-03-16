//
//  SuccessModal.swift
//  pomodoreSG
//
//  Created by MacBook Air on 08/03/23.
//


import SwiftUI
import Lottie

struct SuccessModal: View {
    var title: String
    var message: String
    var action: (() -> Void)
    
    var body: some View {
        ZStack {
            VStack {
                LottieView(loopMode: .loop, name: "done")
                    .scaleEffect(0.5)
                    .frame(width: 30, height: 30)
                    .padding(.bottom, 20)
                
                Text(title)
                    .font(Constants.Fonts.tinyTitleFont)
                    .foregroundColor(Constants.Colors.textIconsColor)
                    .padding(10)
                Text(message)
                    .font(Constants.Fonts.regularFont)
                    .foregroundColor(Constants.Colors.textIconsColor)
                    .padding(10)
                CustomButton(title: "Volver", disabled: false) {
                    action()
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Constants.Colors.accentColor)
                    .shadow(color: Constants.Colors.primaryText, radius: 2, x: 0, y: 2)
            )
            .padding()
            
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center)
        .background(Constants.Colors.lightPrimaryColor.opacity(0.9))
        .ignoresSafeArea()
    }
}

struct SuccessModal_Previews: PreviewProvider {
    static var previews: some View {
        SuccessModal(title: "Título", message: "Mensaje", action: {})
    }
}
