//
//  LogInButtonView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct LoginOrRegistrationButtonView: View {
    @State var buttonName = ""
    @State var buttonColor = Color.blue
    var action: () -> Void
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: width * 0.35, height: height * 0.08, alignment: .center)
                    .foregroundColor(buttonColor)
                Text(buttonName)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            .cornerRadius(15)
        }

    }
}

struct LogInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOrRegistrationButtonView(action: {})
    }
}
