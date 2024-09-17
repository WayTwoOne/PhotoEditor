//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var loginVM = LoginViewModel(service: LoginService())
//    @EnvironmentObject var loginVM: LoginViewModel
    var body: some View {
        NavigationView {
            if !loginVM.isPresentedEditorScreen {
                LogInScreen()
            } else {
                EditorTestScreen()
            }
        }
        .environmentObject(loginVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewModel(service: LoginService()))
            .environmentObject(AuthorizationViewModel())

    }
}
