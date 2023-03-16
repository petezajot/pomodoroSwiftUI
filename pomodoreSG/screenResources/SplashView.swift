//
//  SplashView.swift
//  pomodoreSG
//
//  Created by MacBook Air on 06/03/23.
//

import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = false
    @State var nextView: AnyView? = nil
    private let persistance = LocalPersistanceDefault()
    
    var body: some View {
        VStack{
            Image(uiImage: UIImage(named: "tomato")!)
                .resizable()
                .frame(width: 100, height: 100)
            
            CustomLabels(labelSize: .title, text: "POMODORO")
            
            NavigationLink(destination: nextView, isActive: $isActive, label: {})
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center)
        .onAppear {
            let user = persistance.getStringDefault(key: "email")
            let uid = persistance.getStringDefault(key: "uid")
            let homeView: some View = HomeView().configuredView(userEmail: user, userUid: uid)
            let loginView: some View = LoginView().configuredView()
            nextView = !user.isEmpty ? AnyView(homeView) : AnyView(loginView)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                var transaction = Transaction()
                transaction.disablesAnimations = true
                withTransaction(transaction) {
                    self.isActive = true
                }
            }
        }
        .background(Constants.Colors.textIconsColor)
        .ignoresSafeArea()
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
