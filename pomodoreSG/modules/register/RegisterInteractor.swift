//
//  RegisterInteractor.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import Foundation
import Combine
import SwiftUI

protocol RegisterBusinessLogic {
    func registerNewUser(
        name: String?,
        lastName: String?,
        secondLastName: String?,
        email: String?,
        password: String?,
        passConfirm: String?)
}

final class RegisterInteractor {
    var service: RegisterServiceable!
    var presenter: RegisterPresentationLogic?
    
    var subscriptions = Set<AnyCancellable>()
}

extension RegisterInteractor: RegisterBusinessLogic {
    func registerNewUser(
        name: String?,
        lastName: String?,
        secondLastName: String?,
        email: String?,
        password: String?,
        passConfirm: String?) {
            presenter?.showLoading()
            let error: Error = NSError(domain: "Los campos marcados con * son obligatorios, por favor, revisalos e intenta nuevamente", code: 1)
            guard let username = name, !username.isEmpty else {
                presenter?.presentError(error: error)
                return
            }
            guard let userLastName = lastName, !userLastName.isEmpty else {
                presenter?.presentError(error: error)
                return
            }
            guard let useremail = email, !useremail.isEmpty else {
                presenter?.presentError(error: error)
                return
            }
            let passworderror: Error = NSError(domain: "Las contraseñas no coinciden, por favor, verificalas e intenta nuevamente", code: 1)
            guard let userpass = password, !userpass.isEmpty else {
                presenter?.presentError(error: error)
                return
            }
            if userpass != passConfirm {
                presenter?.presentError(error: passworderror)
                return
            }
            
            service.registerNewUser(email: useremail, password: userpass) { dataResult, error in
                self.saveNewUser(
                    name: username,
                    lastName: userLastName,
                    secondLastName: secondLastName ?? String(),
                    email: useremail,
                    uid: dataResult?.user.uid ?? String())
            }
    }
    
    private func saveNewUser(name: String, lastName: String, secondLastName: String, email: String, uid: String) {
        let misc = Misc()
        let body = ["name": name, "lastName": lastName, "secondLastName": secondLastName, "email": email, "registerDate": misc.currentDate()]
        service.saveNewUser(body: body, uid: uid) { error in
            if let err = error {
                self.presenter?.presentError(error: err)
                return
            }
            self.presenter?.userRegistered()
        }
    }
    
    
}
