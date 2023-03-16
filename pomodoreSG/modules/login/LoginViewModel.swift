//
//  LoginViewModel.swift
//  pomodoreSG
//
//  Created by MacBook Air on 06/03/23.
//

import SwiftUI

protocol LoginViewState  {
    var error: Error? { get set }
    var isLoading: Bool { get set }
    var showNextScreen: Bool { get set }
    var destination: AnyView? { get set }
    
    var fieldsVisible: Bool { get set }
    
    var userTextFieldModel: CustomMailFieldViewModel { get set }
    var passTextFieldModel: CustomSecureFieldViewModel { get set }
}

class LoginViewModel: ObservableObject, LoginViewState {
    @Published var error: Error? = nil
    @Published var isLoading: Bool = false
    
    @Published var showNextScreen: Bool = false
    @Published var destination: AnyView? = nil
    
    @Published var fieldsVisible: Bool = false
    
    @Published var userTextFieldModel: CustomMailFieldViewModel = CustomMailFieldViewModel()
    @Published var passTextFieldModel: CustomSecureFieldViewModel = CustomSecureFieldViewModel()
}

