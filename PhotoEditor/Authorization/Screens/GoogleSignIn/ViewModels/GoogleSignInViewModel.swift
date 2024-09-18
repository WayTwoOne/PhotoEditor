//
//  GoogleSignInViewModel.swift
//  PhotoEditor
//
//  Created by Vladimir on 18.09.2024.
//

import Foundation
import Combine
import Firebase
import GoogleSignIn

final class GoogleSignInViewModel: ObservableObject {
    @Published var isLoginSuccessed = false
    @Published var isPresentedAlert = false
    
    var alertTitle = ""
    var alert = ""
    
    private var service: GoogleSignInProtocol
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: GoogleSignInProtocol) {
        self.service = service
    }
    
    func signInWithGoogle() {
        service
            .signInWithGoogle()
            .sink { [weak self] error in
                switch error {
                case .finished:
                    return
                case .failure(let error):
                    self?.isPresentedAlert = true
                    self?.alertTitle = "Ooops!"
                    self?.alert = error.localizedDescription
                }
            } receiveValue: { [weak self] in
                self?.loginSuccessed()
            }
            .store(in: &subscriptions)
    }
    
    func loginSuccessed() {
        self.isLoginSuccessed.toggle()
    }
    
}

