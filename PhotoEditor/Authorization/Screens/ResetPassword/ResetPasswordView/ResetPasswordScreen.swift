//
//  ResetPasswordScreen.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct ResetPasswordScreen: View {
    @EnvironmentObject var viewModel: AuthorizationViewModel
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Text("Please enter your email address:")
                LogInAndPasswordTextFields(email: $viewModel.email)
                ButtonForAuthenticationModule(buttonName: "Send", buttonColor: .blue, action: {
                    viewModel.resetPassword()
                })
                .alert(isPresented: $viewModel.isPresentedAlert) {
                    Alert(title: Text(viewModel.alertTitle), message: Text(viewModel.alert), dismissButton: .cancel())
                }
            }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            viewModel.presentedModalScreen()
                            viewModel.resetLoginAndPassword()
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

struct ResetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordScreen()
            .environmentObject(AuthorizationViewModel())
    }
}
