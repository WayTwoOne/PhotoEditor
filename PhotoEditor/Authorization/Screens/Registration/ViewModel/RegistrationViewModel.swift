//
//  RegistrationViewModel.swift
//  PhotoEditor
//
//  Created by Vladimir on 17.09.2024.
//

import Foundation
import Combine

enum RegistrationState {
    case successfullyRegistered
    case failed(error: Error)
    case na
}

final class RegisterUser: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var repeatPassword = ""
    
    @Published var state: RegistrationState = .na
    
    @Published var isPresentedFullScreen = false
    var canIPresentFullScreen = false
    @Published var isPresentedAlert = false
    var alertTitle = ""
    var alert = ""
    
    private var service: RegistrationProtocol
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationService) {
        self.service = service
    }
    
    func registerUser() {
        let user = UserData(email: email, password: repeatPassword)
        service
            .register(with: user)
            .sink { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.isPresentedAlert = true
                    self?.alertTitle = "Ooops!"
                    self?.alert = error.localizedDescription
                    
                    if !(self?.passwordsAreTheSame() ?? true) {
                        self?.isPresentedAlert = true
                        self?.alert = "Your passwords don't match"
                    }
                default: break
                }
                } receiveValue: { [weak self] in
                    self?.presentedFullScreen()
                    self?.resetLoginAndPassword()
                }
                
                .store(in: &subscriptions)
            }
    
    func passwordsAreTheSame() -> Bool {
        password == repeatPassword
    }
    
    func presentedFullScreen() {
        isPresentedFullScreen.toggle()
    }
    
    func resetLoginAndPassword() {
        email = ""
        password = ""
        repeatPassword = ""
    }
}
