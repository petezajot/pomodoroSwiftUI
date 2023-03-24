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
                let projects: [Projects] = viewModel.projects
                List {
                    ForEach(projects, id: \.name) { project in
                        VStack (alignment: .leading){
                            HStack(alignment: .top) {
                                Text(project.name)
                                    .foregroundColor(Constants.Colors.primaryText)
                                    .font(Constants.Fonts.bigFont)
                                    .padding()
                                Spacer()
                                Text("Tareas: \(project.tasksNumber)")
                                    .foregroundColor(Constants.Colors.primaryText)
                                    .font(Constants.Fonts.bigFont)
                                    .padding()
                            }
                            
                            HStack {
                                Text("Minutos dedicados: \(project.elapsedTime)")
                                    .foregroundColor(Constants.Colors.primaryText)
                                    .font(Constants.Fonts.tinyFont)
                                    .padding(.leading)
                                Spacer()
                                
                                Button(action: {
                                    print(project.projectId)
                                }) {
                                    EmptyView()
                                }
                            }
                        }.padding(.bottom, 5)
                    }
                    .onDelete { i in
                        print("\(i) was deleted")
                    }
                }
                .overlay(Group {
                    if projects.isEmpty {
                        Text("Aún no tienes proyectos. ¡Crea uno!")
                    }
                })
                
                NavigationLink(destination: viewModel.destination, isActive: $viewModel.showNextScreen, label: {})
            }
            .navigationBarTitle(Text("Proyectos"), displayMode: .inline)
            .background(Constants.Colors.textIconsColor)
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
                    newProject: { interactor?.showNewProject() },
                    profile: {},
                    reports: {},
                    fixes: {},
                    AppLogout: { interactor?.appLogout() })
                .presentationDetents([.height(270)])
                .presentationDragIndicator(.hidden)
            } else {
                MenuView(
                    newProject: { interactor?.showNewProject() },
                    profile: {},
                    reports: {},
                    fixes: {},
                    AppLogout: { interactor?.appLogout() }
                )
            }
        }
        .sheet(isPresented: $viewModel.showCreateNewProject, content: {
            Text("Registrar nuevo proyecto")
        })
        .onChange(of: viewModel.closeApp) { _ in
            presentation.wrappedValue.dismiss()
        }
    }
    
    func viewDidLoad() {
        interactor?.getProjectsList()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

