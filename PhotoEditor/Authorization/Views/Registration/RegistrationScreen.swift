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
        VStack {
            LogInAndPasswordTextFields(email: $viewModel.email, password: $viewModel.password, repeatPassword: $viewModel.repeatPassword, isNewUser: true)
            LoginOrRegistrationButtonView(buttonName: "Register", buttonColor: .green, action: {
                viewModel.register()
            })
        }
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen()
            .environmentObject(AuthorizationViewModel())
    }
}
