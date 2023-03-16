//
//  LoginService.swift
//  pomodoreSG
//
//  Created by MacBook Air on 06/03/23.
//

import Combine
import FirebaseAuth

protocol LoginServiceable {
    func goLogin(user: String, pass: String,_ output: @escaping(AuthDataResult?, Error?) -> Void)
}

class LoginService: LoginServiceable {
    private var authentication = Authentication()
    func goLogin(user: String, pass: String,_ output: @escaping (AuthDataResult?, Error?) -> Void) {
        authentication.firebaseAuth(user: user, pass: pass) { authDataResult, error in
            output(authDataResult, error)
        }
    }
}

