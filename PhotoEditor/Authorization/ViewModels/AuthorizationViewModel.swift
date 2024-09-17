//
//  AuthorizationViewModel.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import Foundation
import Firebase
import FirebaseFirestore

final class AuthorizationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var repeatPassword = ""
    
    var alertTitle = ""
    var alert = ""
    
    @Published var isPresentedFullScreen = false
    @Published var isPresentedEditorScreen = false
    @Published var isPresentedModalScreen = false
    @Published var isPresentedAlert = false
    
    func auth() {
        let user = UserData(email: email, password: password)
        Auth.auth().signIn(withEmail: user.email, password: user.password) { result, errors in
            guard errors == nil else {
                switch errors {
                case .none:
                    return
                case .some(_):
                    self.isPresentedAlert = true
                    self.alert = "You made a mistake in your email or password"
                }
                return
            }
            self.isPresentedEditorScreen = true
        }
    }
    
    func register() {
        self.alert = ""
        let user = UserData(email: email, password: repeatPassword)
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, errors in
            guard errors == nil else {
                switch errors {
                case .none:
                    return
                case .some(let error):
                    self.isPresentedAlert = true
                    self.alert = error.localizedDescription
                }
                
                if !self.passwordsAreTheSame() {
                    self.isPresentedAlert = true
                    self.alert = "Your passwords don't match"
                }
                
                return
            }
            
            self.sendEmailVerification(with: result)
            
            self.addNewUserInBase(with: result, and: user)
        }
    }
    
    func resetPassword() {
        
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            switch error {
            case .none:
                self.isPresentedAlert = true
                self.alertTitle = "Notification"
                self.alert = "Instructions on how to change your password have been sent to your email!"
            case .some(let error):
                self.isPresentedAlert = true
                self.alertTitle = "Ooops!"
                self.alert = error.localizedDescription
            }
            self.presentedModalScreen()
        }
    }
    
    func sendEmailVerification(with result: AuthDataResult?) {
        result?.user.sendEmailVerification()
    }
    
    func addNewUserInBase(with result: AuthDataResult?, and user: UserData) {
        if let uid = result?.user.uid {
            Firestore.firestore()
                .collection("user")
                .document(uid)
                .setData([
                    "email" : user.email,
                    "date" : Date()
                ], merge: true) { error in
                    switch error {
                    case .none:
                        print("success")
                    case .some(let error):
                        print(error.localizedDescription)
                    }
                }
        }
    }
    
    func googleAuth() {
        print("если что переделать под NavigationLink")
    }
    
    func resetLoginAndPassword() {
        email = ""
        password = ""
        repeatPassword = ""
    }
    
    func passwordsAreTheSame() -> Bool {
        password == repeatPassword
    }
    
    func presentedFullScreen() {
        isPresentedFullScreen.toggle()
    }
    
    func presentedModalScreen() {
        isPresentedModalScreen.toggle()
    }
}
