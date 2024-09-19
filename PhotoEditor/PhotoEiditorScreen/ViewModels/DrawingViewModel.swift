//
//  DrawingViewModel.swift
//  PhotoEditor
//
//  Created by Vladimir on 18.09.2024.
//

import Foundation
import PencilKit
import PhotosUI
import UIKit

final class DrawingViewModel: ObservableObject {
    @Published var rendition: Rendition?
    @Published var isSharing = false
    @Published var isSelectingMasterpiece = false
    @Published var isShowingPreview = false
    @Published var isShowingPreviewMessage = false
    @Published var selectedMasterpiece = -1
    @Published var isShowImagePicker: Bool = false
    
    let today = Date()
        var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }
    
    func masterpieceSelected(at index: Int) {
      selectedMasterpiece = index
      isShowingPreview = true
    }
    
    func shareDrawing() {
        if rendition != nil {
            isSharing = true
        }
    }
    
    func rendition(with rendition: Rendition) {
        self.rendition = rendition
    }
    
    func showImagePicker() {
        self.isShowImagePicker.toggle()
    }
    
    func save(canvasView: PKCanvasView) {
        let image = canvasView.drawing.image(from: canvasView.bounds.standardized, scale: UIScreen.main.scale)
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }

}
