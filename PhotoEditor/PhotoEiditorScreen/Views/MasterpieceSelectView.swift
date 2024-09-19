//
//  MasterpieceSelectView.swift
//  PhotoEditor
//
//  Created by Vladimir on 18.09.2024.
//


import SwiftUI

struct MasterpieceSelectView: View {
  // MARK: - Private Constants
  let masterpieces: [PracticeDrawing]
  let selected: Int
  let onSelected: ((Int) -> Void)?

  var body: some View {
    VStack {
      Text("Double-tap to select a masterpiece")
        .font(.headline)
        .padding(.top)
      ScrollView(.horizontal) {
        HStack {
          ForEach(0..<masterpieces.count) { index in
            // swiftlint:disable:next force_unwrapping
            Image(uiImage: UIImage(named: "\(masterpieces[index].name)")!)
              .resizable()
              .frame(width: 200, height: 200)
              .aspectRatio(contentMode: .fit)
              .padding(5)
              .scaleEffect(index == selected ? 1.05 : 0.95)
              .animation(.easeInOut)
              .onTapGesture(count: 2) {
                onSelected?(index)
              }
          }
        }
      }.padding([.leading, .bottom, .trailing], 10)
    }
  }
}

struct MasterpiecSelectView_Previews: PreviewProvider {
  static var previews: some View {
    MasterpieceSelectView(
      masterpieces: [
        PracticeDrawing(name: "example1"),
        PracticeDrawing(name: "example2")
      ],
      selected: 0,
      onSelected: nil
    )
  }
}
