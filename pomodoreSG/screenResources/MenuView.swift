//
//  MenuView.swift
//  pomodoreSG
//
//  Created by MacBook Air on 09/03/23.
//

import SwiftUI

struct MenuView: View {
    var newProject: (() -> Void)
    var profile: (() -> Void)
    var reports: (() -> Void)
    var fixes: (() -> Void)
    var AppLogout: (() -> Void)
    
    var body: some View {
        VStack {
            HStack {
                MenuButton(image: "project", title: "Crear proyecto", action: { newProject() })
                Spacer()
                MenuButton(image: "profile", title: "Perfil", action: { profile() })
                Spacer()
                MenuButton(image: "report", title: "Reportes", action: { reports() })
                Spacer()
                MenuButton(image: "fixes", title: "Ajustes", action: { fixes() })
            }.padding()
            HStack {
                MenuButton(image: "logout", title: "Cerrar sesión", action: { AppLogout() })
            }.padding()
        }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center)
            .background(Constants.Colors.lightPrimaryColor)
            .ignoresSafeArea()
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(
            newProject: {},
            profile: {},
            reports: {},
            fixes: {},
            AppLogout: {})
    }
}
