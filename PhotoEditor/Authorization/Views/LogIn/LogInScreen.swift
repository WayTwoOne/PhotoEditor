//
//  LogInView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct LogInScreen: View {
    @EnvironmentObject var viewModel: AuthorizationViewModel
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                LogInAndPasswordTextFields(email: $viewModel.email, password: $viewModel.password, isSignIn: true, isNewUser: false)
                
                ResetPasswordView()

                LoginOrRegistrationButtonView(buttonName: "Login", buttonColor: .green, action: {
                    viewModel.auth()
                }).alert(isPresented: $viewModel.isPresentedAlert) {
                    Alert(title: Text("Ooops!"), message: Text(viewModel.alert), dismissButton: .cancel())
                }
            }
            
            
            VStack(spacing: 10) {
                
                GoogleAuthorization()
                    .padding(.top, 30)
                
                
                RegistrationButtonView()
                    .padding()
            }
            .navigationTitle("Authorization")
            
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen()
            .environmentObject(AuthorizationViewModel())
    }
}
