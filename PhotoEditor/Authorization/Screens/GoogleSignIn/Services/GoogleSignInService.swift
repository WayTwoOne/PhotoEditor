//
//  GoogleSignInService.swift
//  PhotoEditor
//
//  Created by Vladimir on 18.09.2024.
//

import Foundation
import Combine
import Firebase
import GoogleSignIn

protocol GoogleSignInProtocol {
    func signInWithGoogle() -> AnyPublisher<Void, Error>
}

final class GoogleSignInService: GoogleSignInProtocol {
    func signInWithGoogle() -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                
                let config = GIDConfiguration(clientID: clientID)
                GIDSignIn.sharedInstance.configuration = config
                GIDSignIn.sharedInstance.signIn(withPresenting: ApplicationUtility.rootViewController) { user, error in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                    }
                    
                    guard
                        let user = user?.user,
                        let idToken = user.idToken else { return }
                    
                    let accessToken = user.accessToken
                    
                    let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
                    
                    Auth
                        .auth()
                        .signIn(with: credential) { result, error in
                        if let error = error {
                            promise(.failure(error))
                        } else {
                            promise(.success(()))
                        }
                    }
                }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
