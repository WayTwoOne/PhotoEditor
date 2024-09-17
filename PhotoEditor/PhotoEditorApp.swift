//
//  PhotoEditorApp.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct PhotoEditorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var viewModel = AuthorizationViewModel()
//    @StateObject private var loginVM = LoginViewModel(service: LoginService())
    @StateObject private var registerVM = RegisterUser(service: RegistrationService())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
//                .environmentObject(loginVM)
                .environmentObject(registerVM)
        }
    }
}
