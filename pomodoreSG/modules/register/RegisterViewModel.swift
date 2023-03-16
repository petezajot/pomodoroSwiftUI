//
//  RegisterViewModel.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import SwiftUI

protocol RegisterViewState  {
    var error: Error? { get set }
    var isLoading: Bool { get set }
    var showNextScreen: Bool { get set }
    var destination: AnyView? { get set }
    
    var isSuccesful: Bool { get set }
    
    var name: CustomTextFieldViewModel { get set }
    var lastName: CustomTextFieldViewModel { get set }
    var secondLastName: CustomTextFieldViewModel { get set }
    var email: CustomMailFieldViewModel { get set }
    var pass: CustomSecureFieldViewModel { get set }
    var confirmPass: CustomSecureFieldViewModel { get set }
}

class RegisterViewModel: ObservableObject, RegisterViewState {
    @Published var error: Error? = nil
    @Published var isLoading: Bool = false
    
    @Published var showNextScreen: Bool = false
    @Published var destination: AnyView? = nil
    
    @Published var isSuccesful: Bool = false
    
    @Published var name: CustomTextFieldViewModel = CustomTextFieldViewModel()
    @Published var lastName: CustomTextFieldViewModel = CustomTextFieldViewModel()
    @Published var secondLastName: CustomTextFieldViewModel = CustomTextFieldViewModel()
    @Published var email: CustomMailFieldViewModel = CustomMailFieldViewModel()
    @Published var pass: CustomSecureFieldViewModel = CustomSecureFieldViewModel()
    @Published var confirmPass: CustomSecureFieldViewModel = CustomSecureFieldViewModel()
}

