//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthorizationViewModel
    var body: some View {
        NavigationView {
            if viewModel.isPresentedEditorScreen {
                EditorTestScreen()
            } else {
                LogInScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthorizationViewModel())
    }
}
