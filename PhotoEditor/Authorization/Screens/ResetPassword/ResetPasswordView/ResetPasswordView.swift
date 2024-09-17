//
//  ResetPasswordView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel: AuthorizationViewModel
    var body: some View {
        Button(action: {
            viewModel.presentedModalScreen()
        }) {
            Text("Forgot my password")
                .foregroundColor(.gray)
        }.sheet(isPresented: $viewModel.isPresentedModalScreen) {
            ResetPasswordScreen()
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
