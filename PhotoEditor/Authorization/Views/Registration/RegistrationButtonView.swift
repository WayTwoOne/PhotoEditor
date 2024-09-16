//
//  RegistrationButtonView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct RegistrationButtonView: View {
    var body: some View {
        HStack {
            Text("Dont have an account?")
            NavigationLink(destination: RegistrationScreen()) {
                Text("Sign up")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct RegistrationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationButtonView()
    }
}
