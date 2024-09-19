//
//  DrawingView.swift
//  PhotoEditor
//
//  Created by Vladimir on 18.09.2024.
//


import SwiftUI
import PencilKit

struct DrawingView: View {
    
    @State private var canvasView = PKCanvasView()
    @StateObject var viewModel = DrawingViewModel()
    
    @State var image: Image? = nil
    
    var body: some View {
        ZStack {
            CanvasView(canvasView: $canvasView, onSave: saveDrawing)
                .padding(20.0)
                .background(Color.gray)
                .navigationBarTitle(Text("Editor"), displayMode: .inline)
                .navigationBarItems(
                    leading:
                        
                        Button(action: {
                            viewModel.showImagePicker()
                        }, label: {
                            Image(systemName: "plus.app")
                        })
                        .sheet(isPresented: $viewModel.isShowImagePicker) {
                            ImagePicker(sourceType: .photoLibrary) { image in
                                self.image = Image(uiImage: image)
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

