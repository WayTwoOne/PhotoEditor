//
//  RegistrationScreen.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct RegistrationScreen: View {
    @EnvironmentObject var viewModel: AuthorizationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                LogInAndPasswordTextFields(email: $viewModel.email, password: $viewModel.password, repeatPassword: $viewModel.repeatPassword, isSignIn: true, isNewUser: true)
                ButtonForAuthenticationModule(buttonName: "Register", buttonColor: .green, action: {
                    viewModel.register()
                    viewModel.resetLoginAndPassword()
                    viewModel.presentedFullScreen()
                }).alert(isPresented: $viewModel.isPresentedAlert) {
                    Alert(title: Text("Ooops!"), message: Text(viewModel.alert), dismissButton: .cancel())
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.resetLoginAndPassword()
                        viewModel.presentedFullScreen()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Login")
                        }
                        .foregroundColor(.black)
                    }

                }
            }
        }
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen()
            .environmentObject(AuthorizationViewModel())
    }
}
