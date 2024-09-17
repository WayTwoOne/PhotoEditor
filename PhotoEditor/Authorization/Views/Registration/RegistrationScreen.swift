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
                LogInAndPasswordTextFields(email: $viewModel.email, password: $viewModel.password, repeatPassword: $viewModel.repeatPassword, isNewUser: true)
                LoginOrRegistrationButtonView(buttonName: "Register", buttonColor: .green, action: {
                    viewModel.register()
                })
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.presented()
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
