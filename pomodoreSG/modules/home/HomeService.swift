//
//  HomeService.swift
//  pomodoreSG
//
//  Created by MacBook Air on 08/03/23.
//

import Combine
import FirebaseFirestore

protocol HomeServiceable {
    func getProjectsList(uid: String, _ output: @escaping(QuerySnapshot?, Error?) -> Void)
}

class HomeService: HomeServiceable {
    private var request = RequestFirebase()
    
    func getProjectsList(uid: String, _ output: @escaping (QuerySnapshot?, Error?) -> Void) {
        request.getValuesByUid(collection: "projects", uid: uid) { querySnapshot, error in
            output(querySnapshot, error)
        }
    }
}

