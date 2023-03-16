//
//  HomeInteractor.swift
//  pomodoreSG
//
//  Created by MacBook Air on 08/03/23.
//

import Foundation
import Combine
import SwiftUI

protocol HomeBusinessLogic {
    func getProjectsList()
}

final class HomeInteractor {
    var service: HomeServiceable!
    var presenter: HomePresentationLogic?
    var subscriptions = Set<AnyCancellable>()
    var user: String
    var uid: String
    let persistance = LocalPersistanceDefault()
    
    init(user: String, uid: String) {
        self.user = user
        self.uid = uid
        saveDefaults()
    }
    
    private func saveDefaults() {
        persistance.setStringDefault(key: "email", value: user)
        persistance.setStringDefault(key: "uid", value: uid)
        
        let user = persistance.getStringDefault(key: "email")
        let uid = persistance.getStringDefault(key: "uid")
        print("USER: \(user) UID: \(uid)")
    }
}

extension HomeInteractor: HomeBusinessLogic {
    func getProjectsList() {
        service.getProjectsList(uid: uid) { querySnapshot, error in
            if let err = error {
                self.presenter?.presentError(error: err)
                return
            }
            
            self.presenter?.showProjectsList(querySnapshot: querySnapshot!)
        }
    }
}
