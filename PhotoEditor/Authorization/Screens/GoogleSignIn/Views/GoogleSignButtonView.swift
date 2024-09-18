//
//  GoogleSignButton.swift
//  PhotoEditor
//
//  Created by Vladimir on 16.09.2024.
//

import SwiftUI

struct GoogleSignButtonView: View {
    private var width = UIScreen.main.bounds.width
    private var height = UIScreen.main.bounds.height
    
    var body: some View {
            Image("googleIcon")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
        }
    }

struct GoogleSignButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSignButtonView()
    }
}
