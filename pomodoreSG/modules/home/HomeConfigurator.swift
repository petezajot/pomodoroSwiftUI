//
//  HomeConfigurator.swift
//  pomodoreSG
//
//  Created by MacBook Air on 08/03/23.
//

import SwiftUI

extension HomeView {
    func configuredView(userEmail: String, userUid: String) -> some View {
        var view = self
        let interactor = HomeInteractor(user: userEmail, uid: userUid)
        let presenter = HomePresenter()
        let service = HomeService()
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.service = service
        presenter.viewModel = view.viewModel
        view.viewDidLoad()
        return view
    }
}
