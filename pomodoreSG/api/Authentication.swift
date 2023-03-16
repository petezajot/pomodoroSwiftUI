//
//  Authentication.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import Foundation
import FirebaseAuth

class Authentication {
    func firebaseAuth(user: String, pass: String, _ output: @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: user, password: pass) { authResult, error in
            output(authResult, error)
        }
    }
    
    func firebaseRegister(user: String, pass: String, _ output: @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: user, password: pass) { authResult, error in
            output(authResult, error)
        }
    }
}
