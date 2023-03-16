//
//  RegisterPresenter.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import UIKit
import SwiftUI

protocol RegisterPresentationLogic {
    func showLoading()
    func hideLoading()
    func presentError(error: Error)
    func presentNextScreen(view: AnyView)
    
    func userRegistered()
}

final class RegisterPresenter {
    var viewModel: RegisterViewState?
}

extension RegisterPresenter: RegisterPresentationLogic {
    func userRegistered() {
        hideLoading()
        viewModel?.isSuccesful.toggle()
    }
    
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
