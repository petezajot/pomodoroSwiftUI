//
//  RequestFirebase.swift
//  pomodoreSG
//
//  Created by MacBook Air on 08/03/23.
//

import Foundation
import FirebaseFirestore

class RequestFirebase {
    private let db = Firestore.firestore()
    
    func saveData(collection: String, uid: String, data: [String: String], _ output: @escaping(Error?) -> Void) {
        let path = Firestore.firestore().collection(collection).document(uid)
        path.setData(data, merge: true) { error in
            output(error)
        }
    }
    
    func getValuesByUid(collection: String, uid: String, _ output: @escaping(QuerySnapshot?, Error?) -> Void) {
        db.collection(collection).whereField("uid", isEqualTo: uid)
            .getDocuments() { querySnapshot, error in
                output(querySnapshot, error)
            }
    }
}
