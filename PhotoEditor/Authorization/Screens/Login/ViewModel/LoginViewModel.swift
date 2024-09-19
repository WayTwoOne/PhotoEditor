//
//  LoginViewModel.swift
//  PhotoEditor
//
//  Created by Vladimir on 17.09.2024.
//

import Foundation
import Combine
import Firebase
import UIComponents

enum LoginState {
    case successfullyRegistered
    case failed(error: Error)
    case na
}

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    var alertTitle = ""
    var alert = ""
    
    @Published var isPresentedAlert = false
    @Published var isPresentedEditorScreen = false
    
    private var service: LoginProtocol
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: LoginProtocol) {
        self.service = service
    }
    
    func auth() {
        let user = UserData(email: email, password: password)
        service
            .register(with: user)
            .sink { [weak self] result in
                switch result {
                case .finished:
                    return
                case .failure(_):
                    self?.isPresentedAlert = true
                    self?.alertTitle = "Ooops!"
                    self?.alert = "You made a mistake in your email or password"
                }
            } receiveValue: { [weak self] in
                self?.presentedEditorScreen()
            }
            .store(in: &subscriptions)
    }
    
    func presentedEditorScreen() {
        self.isPresentedEditorScreen.toggle()
    }
}
