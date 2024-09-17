//
//  LogInView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct LogInScreen: View {
    @EnvironmentObject var loginVM: LoginViewModel
    @StateObject private var registerVM = RegisterUser(service: RegistrationService())
//    @EnvironmentObject var registerVM: RegisterUser
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                LogInAndPasswordTextFields(email: $loginVM.email, password: $loginVM.password, isSignIn: true, isNewUser: false)
                
                ResetPasswordView()

                ButtonForAuthenticationModule(buttonName: "Sign in", buttonColor: .green, action: {
                    loginVM.auth()
                }).alert(isPresented: $loginVM.isPresentedAlert) {
                    Alert(title: Text("Ooops!"), message: Text(loginVM.alert), dismissButton: .cancel())
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
        .environmentObject(registerVM)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen()
            .environmentObject(LoginViewModel(service: LoginService()))
            .environmentObject(RegisterUser(service: RegistrationService()))
    }
}
