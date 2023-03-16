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
}

final class HomePresenter {
    var viewModel: HomeViewState?
}

extension HomePresenter: HomePresentationLogic {
    func showProjectsList(querySnapshot: QuerySnapshot) {
        let document = querySnapshot.documents
        let _ = Result {
            try document.compactMap {
                let projects: Projects = try $0.data(as: Projects.self)
                viewModel?.projects.append(projects)
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
