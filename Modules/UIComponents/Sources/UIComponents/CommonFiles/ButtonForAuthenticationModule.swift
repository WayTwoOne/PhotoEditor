//
//  LogInButtonView.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

public struct ButtonForAuthenticationModule: View {
    @State public var buttonName = ""
    @State public var buttonColor = Color.blue
    public var action: () -> Void
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    public init(buttonName: String = "", buttonColor: SwiftUI.Color = Color.blue, action: @escaping () -> Void) {
        self.buttonName = buttonName
        self.buttonColor = buttonColor
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: width * 0.9, height: height * 0.08, alignment: .center)
                    .foregroundColor(buttonColor)
                Text(buttonName)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            .cornerRadius(15)
        }

    }
}

struct ButtonForAuthenticationModule_Previews: PreviewProvider {
    static var previews: some View {
        ButtonForAuthenticationModule(buttonName: "Hello wordl", buttonColor: .blue) {
            ()
        }
    }
}
