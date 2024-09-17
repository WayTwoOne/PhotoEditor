//
//  RegistrationService.swift
//  PhotoEditor
//
//  Created by Vladimir on 17.09.2024.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestore

enum RegistrationKeys: String {
    case email
    case date
}

protocol RegistrationProtocol {
    func register(with userData: UserData) -> AnyPublisher<Void, Error>
}

final class RegistrationService: RegistrationProtocol {
    func register(with userData: UserData) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth.auth().createUser(withEmail: userData.email,
                                       password: userData.password) { result, error in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                        if let uid = result?.user.uid {
                            let values = [
                                RegistrationKeys.email.rawValue : userData.email,
                                RegistrationKeys.date.rawValue : Date()
                            ] as [String : Any]
                            Firestore.firestore()
                                .collection("user")
                                .document(uid)
                                .setData(values, merge: true) { error in
                                    switch error {
                                    case .none:
                                        print("success")
                                    case .some(let error):
                                        print(error.localizedDescription)
                                    }
                                }
                        }
                    }
                    result?
                        .user
                        .sendEmailVerification()
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}

