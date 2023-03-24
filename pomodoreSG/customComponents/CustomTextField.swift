//
//  CustomTextField.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import SwiftUI

class CustomTextFieldViewModel: ObservableObject{
    @Published var text: String = String()
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var viewModel: CustomTextFieldViewModel
    
    var body: some View {
        ZStack (alignment: .leading){
            if viewModel.text.isEmpty {
                CustomLabels(labelSize: .placeholder, text: placeholder)
                    .padding(.leading, 10)
            }
            TextField("", text: $viewModel.text)
                .frame(height: 48)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .border(Constants.Colors.primaryText, width: 2)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1.5)
                )
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(Constants.Colors.accentColor)
                .keyboardType(.default)
                .font(Constants.Fonts.bigFont)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
        }
        .background(Constants.Colors.textIconsColor)
        .padding(15)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        let customTextFieldViewModel = CustomTextFieldViewModel()
        CustomTextField(
            placeholder: "CustomTextField",
            viewModel: Binding.constant(customTextFieldViewModel)
        )
    }
}
