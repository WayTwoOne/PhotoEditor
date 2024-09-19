//
//  ResetPasswordScreen.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI
import UIComponents

struct ResetPasswordScreen: View {
    @EnvironmentObject var resetPasswordVM: ResetPasswordViewModel
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Text("Please enter your email address:")
                LogInAndPasswordTextFields(email: $resetPasswordVM.email, isSignIn: false, isNewUser: false)
                ButtonForAuthenticationModule(buttonName: "Send", buttonColor: .blue, action: {
                    resetPasswordVM.passwordResetRequest()
                })
                .alert(isPresented: $resetPasswordVM.isPresentedAlert) {
                    Alert(title: Text(resetPasswordVM.alertTitle), message: Text(resetPasswordVM.alert), dismissButton: .destructive(Text("Okay").foregroundColor(.black), action: {
                        if resetPasswordVM.alertTitle != "Ooops!" {
                            resetPasswordVM.resetEmail()
                            resetPasswordVM.presentedModalScreen()
                        }
                    }))
                }
            }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            resetPasswordVM.presentedModalScreen()
                            resetPasswordVM.resetEmail()
                        } label: {
                            HStack {
                                Image(systemName: "arrow.left")
                                Text("Authorization")
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
                .navigationTitle("Reset password")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ResetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordScreen()
            .environmentObject(ResetPasswordViewModel(service: ResetPasswordService()))
    }
}
