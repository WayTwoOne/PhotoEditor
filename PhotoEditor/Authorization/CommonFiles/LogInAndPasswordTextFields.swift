//
//  LogInAndPasswordTextFields.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct LogInAndPasswordTextFields: View {
    var email: Binding<String>
    var password: Binding<String>?
    var repeatPassword: Binding<String>?
    var isSignIn: Bool = false
    var isNewUser: Bool = false
    
    var body: some View {
        VStack() {
            TextField("Email", text: email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
           
            if isSignIn {
                SecureField("Password", text: password!)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
            }
            
            if isNewUser {
                SecureField("Password", text: repeatPassword! )
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
            }
            
        }
        .padding(.horizontal)
    }
}

struct LogInAndPasswordTextFields_Previews: PreviewProvider {
    static var previews: some View {
        LogInAndPasswordTextFields(email: .constant("Hello"), password: .constant("Bye"))
    }
}
