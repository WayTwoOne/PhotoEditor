//
//  ResetPasswordView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var resetPasswordVM: ResetPasswordViewModel
    var body: some View {
        Button(action: {
            resetPasswordVM.presentedModalScreen()
        }) {
            Text("Forgot my password")
                .foregroundColor(.gray)
        }.sheet(isPresented: $resetPasswordVM.isPresentedModalScreen) {
            ResetPasswordScreen()
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
