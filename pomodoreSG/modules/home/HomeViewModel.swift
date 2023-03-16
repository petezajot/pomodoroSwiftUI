//
//  HomeViewModel.swift
//  pomodoreSG
//
//  Created by MacBook Air on 08/03/23.
//

import SwiftUI

protocol HomeViewState  {
    var error: Error? { get set }
    var isLoading: Bool { get set }
    var showNextScreen: Bool { get set }
    var destination: AnyView? { get set }
    
    var projects: [Projects] { get set }
    var showMenu: Bool { get set }
}

class HomeViewModel: ObservableObject, HomeViewState {
    @Published var error: Error? = nil
    @Published var isLoading: Bool = false
    
    @Published var showNextScreen: Bool = false
    @Published var destination: AnyView? = nil
    
    @Published var projects: [Projects] = [Projects]()
    @Published var showMenu: Bool = false
}

struct Projects: Codable {
    var elapsedTime: Int
    var name: String
    var tasksNumber: Int
    var uid: String
}
