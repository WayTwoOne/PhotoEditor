//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            LogInScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthorizationViewModel())
    }
}
