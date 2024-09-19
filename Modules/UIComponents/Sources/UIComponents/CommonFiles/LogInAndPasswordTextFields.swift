//
//  LogInAndPasswordTextFields.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

public struct LogInAndPasswordTextFields: View {
    public var email: Binding<String>
    public var password: Binding<String>?
    public var repeatPassword: Binding<String>?
    public var isSignIn: Bool = false
    public var isNewUser: Bool = false
    
    public init(email: Binding<String>, password: Binding<String>? = nil, repeatPassword: Binding<String>? = nil, isSignIn: Bool, isNewUser: Bool) {
        self.email = email
        self.password = password
        self.repeatPassword = repeatPassword
        self.isSignIn = isSignIn
        self.isNewUser = isNewUser
    }
    
    public var body: some View {
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
