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
        LogInAndPasswordTextFields(email: $viewModel.email)
    }
}

struct ResetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordScreen()
            .environmentObject(AuthorizationViewModel())
    }
}
