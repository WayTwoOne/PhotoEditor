//
//  DrawingView.swift
//  PhotoEditor
//
//  Created by Vladimir on 18.09.2024.
//


import SwiftUI
import PencilKit

struct DrawingView: View {
  // MARK: - Private Constants


  // MARK: - State variables
  @State private var canvasView = PKCanvasView()
    @StateObject var viewModel = DrawingViewModel()

  var body: some View {
    NavigationView {
      ZStack {
        CanvasView(canvasView: $canvasView, onSaved: saveDrawing)
          .padding(20.0)
        .background(Color.gray)
        .navigationBarTitle(Text("Masterpiece"), displayMode: .inline)
        .navigationBarItems(
          leading: HStack {
            Button {
                viewModel.isSelectingMasterpiece = true
            } label: {
              Image(systemName: "plus")
            }.popover(
                isPresented: $viewModel.isSelectingMasterpiece,
              arrowEdge: .top
            ) {
              MasterpieceSelectView(
                masterpieces: viewModel.masterpieces,
                selected: viewModel.selectedMasterpiece,
                onSelected: viewModel.masterpieceSelected)
            }
              Button(action: viewModel.handlePreview) {
                viewModel.isShowingPreview ?
                Image(systemName: "eye.slash") :
                Image(systemName: "eye")
            }.popover(
                isPresented: $viewModel.isShowingPreviewMessage,
              arrowEdge: .top
            ) {
              Text("Please select a masterpiece").padding()
            }
          },
          trailing: HStack {
              Button(action: viewModel.shareDrawing) {
              Image(systemName: "square.and.arrow.up")
            }.sheet(isPresented: $viewModel.isSharing) {
              ShareSheet(
                activityItems: [viewModel.rendition?.image as Any],
                excludedActivityTypes: [])
            }
            Button(action: restoreDrawing) {
              Image(systemName: "arrow.uturn.left")
            }
            Button(action: deleteDrawing) {
              Image(systemName: "trash")
            }
          })
          if viewModel.isShowingPreview {
              MasterpieceView(masterpiece: viewModel.masterpieces[viewModel.selectedMasterpiece])
        }
      }
    }.navigationViewStyle(StackNavigationViewStyle())
  }
}

// MARK: - Private Methods
private extension DrawingView {
  func saveDrawing() {
    let image = canvasView.drawing.image(
      from: canvasView.bounds, scale: UIScreen.main.scale)
    let rendition = Rendition(
      title: "Best Drawing",
      drawing: canvasView.drawing,
      image: image)
      viewModel.rendition(with: rendition)
  }

  func deleteDrawing() {
    canvasView.drawing = PKDrawing()
  }

  func restoreDrawing() {
      if let rendition = viewModel.rendition {
      canvasView.drawing = rendition.drawing
    }
  }


}

struct DrawingView_Previews: PreviewProvider {
  static var previews: some View {
    DrawingView()
  }
}
