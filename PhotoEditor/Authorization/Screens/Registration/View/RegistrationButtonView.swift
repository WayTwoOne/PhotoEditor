//
//  RegistrationButtonView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct RegistrationButtonView: View {
    @EnvironmentObject var registerVM: RegisterUser
    
    var body: some View {
        HStack {
            Text("Dont have an account?")
            Button {
                registerVM.presentedFullScreen()
            } label: {
                Text("Sign up")
                    .foregroundColor(.blue)
            }.fullScreenCover(isPresented: $registerVM.isPresentedFullScreen) {
                RegistrationScreen()
            }
        }
    }
}

struct RegistrationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationButtonView()
            .environmentObject(RegisterUser(service: RegistrationService()))
    }
}
