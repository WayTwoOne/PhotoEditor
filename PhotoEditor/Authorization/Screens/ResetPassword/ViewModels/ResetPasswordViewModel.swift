//
//  ResetPasswordViewModel.swift
//  PhotoEditor
//
//  Created by Vladimir on 17.09.2024.
//

import Foundation
import Combine

final class ResetPasswordViewModel: ObservableObject {
    
    let service: ResetPasswordService
    @Published var email: String = ""
    
    var alertTitle = ""
    var alert = ""
    
    @Published var isPresentedAlert = false
    @Published var isPresentedModalScreen = false

    private var subscriptions = Set<AnyCancellable>()
    
    init(service: ResetPasswordService) {
        self.service = service
    }
    
    func passwordResetRequest() {
        service
            .sendPasswordResetRequest(to: email)
            .sink { [weak self] result in
                switch result {
                case .finished:
                    return
                case .failure(let error):
                    self?.isPresentedAlert = true
                    self?.alertTitle = "Ooops!"
                    self?.alert = error.localizedDescription
                }
            } receiveValue: { [weak self] in
                self?.isPresentedAlert = true
                self?.alertTitle = "Notification"
                self?.alert = "Instructions on how to change your password have been sent to your email!"
            }
            .store(in: &subscriptions)
    }
    
    func presentedModalScreen() {
        isPresentedModalScreen.toggle()
    }
    
    func resetEmail() {
        email = ""
    }
}
