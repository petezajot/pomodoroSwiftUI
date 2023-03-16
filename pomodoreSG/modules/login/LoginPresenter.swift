//
//  LoginPresenter.swift
//  pomodoreSG
//
//  Created by MacBook Air on 06/03/23.
//

import UIKit
import SwiftUI
import FirebaseAuth

protocol LoginPresentationLogic {
    func showLoading()
    func hideLoading()
    func presentError(error: Error)
    func presentNextScreen(view: AnyView)
}

final class LoginPresenter {
    var viewModel: LoginViewState?
}

extension LoginPresenter: LoginPresentationLogic {
    func showLoading() {
        withAnimation(.easeIn(duration: 0.2)) {
            viewModel?.isLoading.toggle()
        }
    }
    
    func hideLoading() {
        withAnimation(.easeOut(duration: 0.2)) {
            viewModel?.isLoading.toggle()
        }
    }
    
    func presentError(error: Error) {
        viewModel?.error = error
        hideLoading()
    }
    
    func presentNextScreen(view: AnyView) {
        viewModel?.destination = view
        viewModel?.showNextScreen = true
    }
}
