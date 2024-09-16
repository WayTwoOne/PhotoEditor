//
//  LogInView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct LogInView: View {
    @State private var login = ""
    @State private var password = ""
    var body: some View {
        VStack(spacing: 15) {
            LogInAndPasswordTextFields(login: $login, password: $password)
            LogInButtonView(buttonName: "Login", buttonColor: .green)
            GoogleAuthorization()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
