//
//  ResetPasswordService.swift
//  PhotoEditor
//
//  Created by Vladimir on 17.09.2024.
//

import Foundation
import Combine
import FirebaseAuth

protocol ResetPasswordProtocol {
    func sendPasswordResetRequest(to email: String) -> AnyPublisher<Void, Error>
}

final class ResetPasswordService: ResetPasswordProtocol {
    func sendPasswordResetRequest(to email: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth
                    .auth()
                    .sendPasswordReset(withEmail: email) { error in
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
