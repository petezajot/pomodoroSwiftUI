//
//  LoginInteractor.swift
//  pomodoreSG
//
//  Created by MacBook Air on 06/03/23.
//

import Foundation
import Combine
import SwiftUI

protocol LoginBusinessLogic {
    func goLogin(user: String?, pass: String?)
    func presentRegisterScreen()
}

final class LoginInteractor {
    var service: LoginServiceable!
    var presenter: LoginPresentationLogic?
    
    var subscriptions = Set<AnyCancellable>()
}

extension LoginInteractor: LoginBusinessLogic {
    func presentRegisterScreen() {
        let registerView = RegisterView().configuredView()
        presenter?.presentNextScreen(view: AnyView(registerView))
    }
    
    func goLogin(user: String?, pass: String?) {
        presenter?.showLoading()
        
        guard let userValue = user, !userValue.isEmpty else {
            let error: Error = NSError(domain: "Es necesario capturar el usuario.", code: 1)
            presenter?.presentError(error: error)
            return
        }
        
        guard let password = pass, !password.isEmpty else {
            let error: Error = NSError(domain: "Es necesario capturar la contraseña.", code: 1)
            presenter?.presentError(error: error)
            return
        }
        service.goLogin(user: userValue, pass: password) { (authDataResult, error) in
            if let _ = error {
                let error: Error = NSError(domain: "El usuario/contraseña son erroneos, por favor, revisalos e intenta nuevamente.", code: 1)
                self.presenter?.presentError(error: error)
                return
            }else{
                if let res = authDataResult {
                    self.presenter?.hideLoading()
                    let homeView = HomeView().configuredView(userEmail: res.user.email ?? String(), userUid: res.user.uid)
                    self.presenter?.presentNextScreen(view: AnyView(homeView))
                }else{
                    let error: Error = NSError(domain: "Ocurrió algo, por favor, intenta más tarde.", code: 1)
                    self.presenter?.presentError(error: error)
                }
            }
        }
    }
    
    
}
