//
//  RegistrationScreen.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI
import UIComponents

struct RegistrationScreen: View {
    @EnvironmentObject var registerVM: RegisterUser
    
    var body: some View {
        NavigationView {
            VStack {
                LogInAndPasswordTextFields(email: $registerVM.email, password: $registerVM.password, repeatPassword: $registerVM.repeatPassword, isSignIn: true, isNewUser: true)
                ButtonForAuthenticationModule(buttonName: "Register", buttonColor: .blue, action: {
                    registerVM.registerUser()
                }).alert(isPresented: $registerVM.isPresentedAlert) {
                    Alert(title: Text(registerVM.alertTitle), message: Text(registerVM.alert), dismissButton: .cancel())
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        registerVM.resetLoginAndPassword()
                        registerVM.presentedFullScreen()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Authorization")
                        }
                        .foregroundColor(.black)
                    }

                }
            }
            .navigationTitle("Registration")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen()
            .environmentObject(RegisterUser(service: RegistrationService()))
    }
}
