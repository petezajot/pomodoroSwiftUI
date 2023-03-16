//
//  RegisterView.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel = RegisterViewModel()
    @Environment(\.presentationMode) var presentation
    var interactor: RegisterBusinessLogic?
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .bottom){
                ScrollView {
                    VStack {
                        CustomTextField(placeholder: "Nombre*", viewModel: $viewModel.name)
                        CustomTextField(placeholder: "Apellido Paterno*", viewModel: $viewModel.lastName)
                        CustomTextField(placeholder: "Apellido Materno", viewModel: $viewModel.secondLastName)
                        CustomMailField(placeholder: "Correo electrónico*", viewModel: $viewModel.email)
                        CustomSecureField(placeholder: "Crea tu contraseña*", viewModel: $viewModel.pass)
                        CustomSecureField(placeholder: "Confirma tu contraseña", viewModel: $viewModel.confirmPass)
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .center)
                }
                HStack {
                    CustomButton(title: "Crear usuario") {
                        interactor?.registerNewUser(
                            name: viewModel.name.text,
                            lastName: viewModel.lastName.text,
                            secondLastName: viewModel.secondLastName.text,
                            email: viewModel.email.text,
                            password: viewModel.pass.text,
                            passConfirm: viewModel.confirmPass.text)
                    }
                }.background(Constants.Colors.darkPrimaryColor.opacity(0.9))
                NavigationLink(destination: viewModel.destination, isActive: $viewModel.showNextScreen, label: {})
            }
            .navigationBarTitle(Text("Registro"), displayMode: .inline)
            .background(Constants.Colors.darkPrimaryColor)
            .navigationBarItems(
                leading: BackButton(action: {
                    presentation.wrappedValue.dismiss()
                }))
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
        .overlay(viewModel.isSuccesful ? SuccessModal(title: "Registrado", message: "Tu usuario ha sido registrado correctamente.", action: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                presentation.wrappedValue.dismiss()
            }
        }) : nil)
    }
    
    func viewDidLoad() {}
}
