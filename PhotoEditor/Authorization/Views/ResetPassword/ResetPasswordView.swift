//
//  ResetPasswordView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var showModal: Bool = false
    var body: some View {
        Button(action: {
            self.showModal = true
        }) {
            Text("Forgot my password")
                .foregroundColor(.gray)
        }.sheet(isPresented: self.$showModal) {
            ResetPasswordScreen()
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
