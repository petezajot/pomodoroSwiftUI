//
//  RegisterService.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import Combine
import FirebaseAuth

protocol RegisterServiceable {
    func registerNewUser(email: String, password: String, _ output: @escaping(AuthDataResult?, Error?) -> Void)
    func saveNewUser(body: [String: String], uid: String,
                     _ output: @escaping(Error?) -> Void)
}

class RegisterService: RegisterServiceable {
    private var auth = Authentication()
    private var firestore = RequestFirebase()
    
    func registerNewUser(email: String, password: String, _ output: @escaping (AuthDataResult?, Error?) -> Void) {
        auth.firebaseRegister(user: email, pass: password) { dataResult, error in
            output(dataResult, error)
        }
    }
    
    func saveNewUser(body: [String: String], uid: String, _ output: @escaping(Error?) -> Void) {
            firestore.saveData(collection: "users", uid: uid, data: body) { error in
                output(error)
            }
    }
}

