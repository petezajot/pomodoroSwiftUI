//
//  LoginConfigurator.swift
//  pomodoreSG
//
//  Created by MacBook Air on 06/03/23.
//

import SwiftUI

extension LoginView {
    func configuredView() -> some View {
        var view = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let service = LoginService()
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.service = service
        presenter.viewModel = view.viewModel
        view.viewDidLoad()
        return view
    }
}
