//
//  HomePresenter.swift
//  pomodoreSG
//
//  Created by MacBook Air on 08/03/23.
//

import UIKit
import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

protocol HomePresentationLogic {
    func showLoading()
    func hideLoading()
    func presentError(error: Error)
    func presentNextScreen(view: AnyView)
    
    func showProjectsList(querySnapshot: QuerySnapshot)
    func hideMenu()
    func showNewProject()
}

final class HomePresenter {
    var viewModel: HomeViewState?
}

extension HomePresenter: HomePresentationLogic {
    func showNewProject() {
        viewModel?.showMenu = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { self.viewModel?.showCreateNewProject = true }
    }
    
    func hideMenu() {
        viewModel?.showMenu = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.viewModel?.closeApp = true
        }
    }
    
    func showProjectsList(querySnapshot: QuerySnapshot) {
        let document = querySnapshot.documents
        let _ = Result {
            try document.compactMap {
                //var projects: Projects = try $0.data(as: Projects.self)
                let data = $0.data()
                let projects: [Projects] = [
                    Projects(
                        elapsedTime: data["elapsedTime"] as! Int,
                        name: data["name"] as! String,
                        tasksNumber: data["tasksNumber"] as! Int,
                        uid: data["uid"] as! String,
                        projectId: $0.documentID)
                ]
                viewModel?.projects.append(contentsOf: projects)
                
            }
        }
    }
    
    func showLoading() {
        //Overlay a progress screen
    }
    
    func hideLoading() {
        //Hide the overlayed progress screen
    }
    
    func presentError(error: Error) {
        viewModel?.error = error
        hideLoading()
    }
    
    func presentNextScreen(view: AnyView) {
        viewModel?.destination = view
        viewModel?.showNextScreen = true
    }
}
