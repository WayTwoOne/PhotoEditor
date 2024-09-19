//
//  DrawingViewModel.swift
//  PhotoEditor
//
//  Created by Vladimir on 18.09.2024.
//

import Foundation
import PencilKit

final class DrawingViewModel: ObservableObject {
    @Published var rendition: Rendition?
    @Published var isSharing = false
    @Published var isSelectingMasterpiece = false
    @Published var isShowingPreview = false
    @Published var isShowingPreviewMessage = false
    @Published var selectedMasterpiece = -1
    
    let masterpieces = [
      PracticeDrawing(name: "example1"),
      PracticeDrawing(name: "example2"),
      PracticeDrawing(name: "example3"),
      PracticeDrawing(name: "example4")
    ]
    
    func masterpieceSelected(at index: Int) {
      selectedMasterpiece = index
      isShowingPreview = true
    }
    
    func handlePreview() {
      if masterpieces.indices.contains(selectedMasterpiece) {
        isShowingPreview.toggle()
      } else {
        isShowingPreviewMessage = true
      }
    }
    
    func shareDrawing() {
        if rendition != nil {
            isSharing = true
        }
    }
    
    func rendition(with rendition: Rendition) {
        self.rendition = rendition
    }

}
