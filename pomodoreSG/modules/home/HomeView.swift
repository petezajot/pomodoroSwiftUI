//
//  HomeView.swift
//  pomodoreSG
//
//  Created by MacBook Air on 08/03/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @Environment(\.presentationMode) var presentation
    var interactor: HomeBusinessLogic?
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        let projects: [Projects] = viewModel.projects
                        ForEach(projects, id: \.name) { project in
                            VStack (alignment: .leading){
                                HStack(alignment: .top) {
                                    Text(project.name)
                                        .foregroundColor(Constants.Colors.textIconsColor)
                                        .font(Constants.Fonts.bigFont)
                                        .padding()
                                    Spacer()
                                    Text("Tareas: \(project.tasksNumber)")
                                        .foregroundColor(Constants.Colors.textIconsColor)
                                        .font(Constants.Fonts.bigFont)
                                        .padding()
                                }
                                
                                HStack {
                                    Text("Minutos dedicados: \(project.elapsedTime)")
                                        .foregroundColor(Constants.Colors.textIconsColor)
                                        .font(Constants.Fonts.tinyFont)
                                        .padding(.leading)
                                    Spacer()
                                    
                                    Button(action: {
                                        print(project.uid)
                                    }) {
                                        Image("more")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                    }.padding()
                                }
                                Divider()
                                    .background(Constants.Colors.dividerColor)
                            }.padding(.bottom, 5)
                        }
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .center)
                }
                
                NavigationLink(destination: viewModel.destination, isActive: $viewModel.showNextScreen, label: {})
            }
            .navigationBarTitle(Text("Proyectos"), displayMode: .inline)
            .background(Constants.Colors.darkPrimaryColor)
            .navigationBarItems(
                trailing: AddButton(action: {
                    viewModel.showMenu.toggle()
                }))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .overlay(viewModel.isLoading ? CustomLoader() : nil)
        .overlay(
            (viewModel.error != nil) ?
            ErrorModal(
                title: "Error",
                message: viewModel.error?.errorDomain ?? "Error") { viewModel.error = nil } :
                nil)
        .sheet(isPresented: $viewModel.showMenu) {
            if #available(iOS 16, *) {
                MenuView(
                    newProject: {},
                    profile: {},
                    reports: {},
                    fixes: {},
                    AppLogout: { AppLogout() })
                    .presentationDetents([.height(270)])
                    .presentationDragIndicator(.hidden)
            } else {
                MenuView(
                    newProject: {},
                    profile: {},
                    reports: {},
                    fixes: {},
                    AppLogout: {
                        AppLogout()
                    })
            }
        }
    }
    
    func viewDidLoad() {
        interactor?.getProjectsList()
    }
    
    func AppLogout() {
        let persistance = LocalPersistanceDefault()
        persistance.deleteDefaultPersistance()
        presentation.wrappedValue.dismiss()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

