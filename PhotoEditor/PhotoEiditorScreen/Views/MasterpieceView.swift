//
//  MasterpieceView.swift
//  PhotoEditor
//
//  Created by Vladimir on 18.09.2024.
//


import SwiftUI

struct MasterpieceView: View {
  // MARK: - Private Constants
  let masterpiece: PracticeDrawing

  // MARK: - State variables
  @State private var currentPosition: CGSize = .zero
  @State private var newPosition: CGSize = .zero

  var body: some View {
    // swiftlint:disable:next force_unwrapping
    Image(uiImage: UIImage(named: "\(masterpiece.name)")!)
      .resizable()
      .frame(width: 200, height: 200)
      .aspectRatio(contentMode: .fit)
      .padding(5)
      .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
      .offset(
        x: currentPosition.width,
        y: currentPosition.height)
      .gesture(DragGesture()
        .onChanged { value in
          currentPosition = CGSize(
            width: value.translation.width + newPosition.width,
            height: value.translation.height + newPosition.height)
        }
      .onEnded { value in
        currentPosition = CGSize(
          width: value.translation.width + newPosition.width,
          height: value.translation.height + newPosition.height)
        newPosition = currentPosition
      }
    )
  }
}

struct MasterpieceView_Previews: PreviewProvider {
  static var previews: some View {
    MasterpieceView(masterpiece: PracticeDrawing(name: "example1"))
  }
}
