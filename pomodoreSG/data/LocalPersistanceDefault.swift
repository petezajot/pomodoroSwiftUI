//
//  LocalPersistanceDefault.swift
//  pomodoreSG
//
//  Created by MacBook Air on 08/03/23.
//

import Foundation

class LocalPersistanceDefault {
    func setStringDefault(key: String, value: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getStringDefault(key: String) -> String{
        guard let value = UserDefaults.standard.string(forKey: key) else {
            return String()
        }
        return value
    }
    
    func deleteDefaultPersistance() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
    }
}
