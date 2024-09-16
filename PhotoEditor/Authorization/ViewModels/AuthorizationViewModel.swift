//
//  AuthorizationViewModel.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import Foundation

final class AuthorizationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var repeatPassword = ""
    
    func auth() {}
    
    func register() {}
    
    func googleAuth() {
        print("если что переделать под NavigationLink")
    }
}
