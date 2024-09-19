//
//  LoadingView.swift
//  PhotoEditor
//
//  Created by Vladimir on 17.09.2024.
//

import SwiftUI

public struct LoadingView: View {
    @State var animate = false
    
    public init(animate: Bool = false) {
        self.animate = animate
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 14)
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 14, lineCap: .round))
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: animate)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
