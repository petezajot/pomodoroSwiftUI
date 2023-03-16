//
//  LoginView.swift
//  pomodoreSG
//
//  Created by MacBook Air on 06/03/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @Environment(\.presentationMode) var presentation
    var interactor: LoginBusinessLogic?
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                VStack {
                    Image(uiImage: UIImage(named: "tomato")!)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    CustomLabels(labelSize: .title, text: "POMODORO")
                    if viewModel.fieldsVisible {
                        CustomMailField(placeholder: "Usuario*", viewModel: $viewModel.userTextFieldModel)
                        CustomSecureField(
                            placeholder: "Contraseña*",
                            viewModel: $viewModel.passTextFieldModel)
                        
                        CustomButton(title: "Iniciar sesión") {
                            interactor?.goLogin(
                                user: $viewModel.userTextFieldModel.text.wrappedValue,
                                pass: $viewModel.passTextFieldModel.text.wrappedValue)
                        }
                        
                        CustomLinkButton(title: "Regístrate") {
                            interactor?.presentRegisterScreen()
                        }
                    }
                }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .center)
                    .background(Constants.Colors.textIconsColor)
                    .ignoresSafeArea()
                
                NavigationLink(destination: viewModel.destination, isActive: $viewModel.showNextScreen, label: {})
            }
            .navigationTitle(Text(""))
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .overlay(viewModel.isLoading ? CustomLoader() : nil)
        .overlay(
            (viewModel.error != nil) ?
            ErrorModal(
                title: "Error",
                message: viewModel.error?.errorDomain ?? "Error") { viewModel.error = nil } :
                nil)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeIn(duration: 0.5)) {
                    self.viewModel.fieldsVisible.toggle()
                }
            }
        }
    }
    
    func viewDidLoad() {} 
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
