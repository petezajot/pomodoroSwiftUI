//
//  SwiftUIView.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import SwiftUI
import Lottie

struct CustomLoader: View {
    var body: some View {
        VStack{
            ProgressView("Espera un momento por favor...")
                .font(Constants.Fonts.bigFont)
                .foregroundColor(Constants.Colors.primaryText)
                .progressViewStyle(CircularProgressViewStyle(tint: Constants.Colors.darkPrimaryColor))
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center)
        .background(Constants.Colors.lightPrimaryColor.opacity(0.9)).ignoresSafeArea()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoader()
    }
}
