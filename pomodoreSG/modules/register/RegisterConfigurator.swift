//
//  RegisterConfigurator.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import SwiftUI

extension RegisterView {
    func configuredView() -> some View {
        var view = self
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter()
        let service = RegisterService()
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.service = service
        presenter.viewModel = view.viewModel
        view.viewDidLoad()
        return view
    }
}
