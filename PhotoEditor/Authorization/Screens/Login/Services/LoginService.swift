//
//  LoginService.swift
//  PhotoEditor
//
//  Created by Vladimir on 17.09.2024.
//

import Foundation
import Combine
import FirebaseAuth

enum LoginKeys: String {
    case email
    case date
}

protocol LoginProtocol {
    func register(with userData: UserData) -> AnyPublisher<Void, Error>
}

final class LoginService: LoginProtocol {
    func register(with userData: UserData) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth
                    .auth()
                    .signIn(withEmail: userData.email,
                            password: userData.password) { result, error in
                        if let error = error {
                            promise(.failure(error))
                        } else {
                            promise(.success(()))
                        }
                    }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
