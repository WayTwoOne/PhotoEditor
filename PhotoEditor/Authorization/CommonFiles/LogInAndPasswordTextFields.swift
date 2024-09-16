//
//  LogInAndPasswordTextFields.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct LogInAndPasswordTextFields: View {
    @Binding var login: String
    @Binding var password: String
    
    var body: some View {
        VStack() {
            TextField("Email", text: $login)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
            
        }
        .padding(.horizontal)
    }
}

struct LogInAndPasswordTextFields_Previews: PreviewProvider {
    static var previews: some View {
        LogInAndPasswordTextFields(login: .constant("Hello"), password: .constant("Bye"))
    }
}
