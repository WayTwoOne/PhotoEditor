//
//  GoogleAuthorization.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct GoogleAuthorization: View {
    var body: some View {
        VStack {
            Text("or sign in with")
                .padding()
            Button {
                ()
            } label: {
                Image("googleIcon")
                    .resizable()
                    .frame(minWidth: 40, idealWidth: 50, maxWidth: 60, minHeight: 40, idealHeight: 50, maxHeight: 60, alignment: .center)
            }
        }
    }
}

struct GoogleAuthorization_Previews: PreviewProvider {
    static var previews: some View {
        GoogleAuthorization()
    }
}
