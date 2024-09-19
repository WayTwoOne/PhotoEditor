//
//  CanvasView.swift
//  PhotoEditor
//
//  Created by Vladimir on 18.09.2024.
//

import SwiftUI
import PencilKit

struct CanvasView {
    @Binding var canvasView: PKCanvasView
    let onSave: () -> Void
    @State var toolPicker = PKToolPicker()
}

class Tool {
    static func getContentViewFromPkCanvasView(_ view: UIView) -> some UIView {
        return view.subviews[0]
    }
}

// MARK: - UIViewRepresentable
extension CanvasView: UIViewRepresentable {
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.tool = PKInkingTool(.pen, color: .gray, width: 10)
#if targetEnvironment(simulator)
        canvasView.drawingPolicy = .anyInput
#endif
        canvasView.delegate = context.coordinator
        showToolPicker()
        return canvasView
    }
    
    func nextUIView(context: Context) -> UIView {
        let view = PKCanvasView()
        view.backgroundColor = .clear
        view.isOpaque = false
        view.maximumZoomScale = 5
        view.minimumZoomScale = 1
        
        let imageView = UIImageView(image: UIImage(named: "NameOfImage"))
        let contentView = Tool.getContentViewFromPkCanvasView(view)
        contentView.addSubview(imageView)
        contentView.sendSubviewToBack(imageView)
        return view
    }

  func updateUIView(_ uiView: PKCanvasView, context: Context) {}

  func makeCoordinator() -> Coordinator {
      Coordinator(canvasView: $canvasView, onSave: onSave)
  }
}

// MARK: - Private Methods
private extension CanvasView {
  func showToolPicker() {
    toolPicker.setVisible(true, forFirstResponder: canvasView)
    toolPicker.addObserver(canvasView)
    canvasView.becomeFirstResponder()
  }
}

// MARK: - Coordinator
class Coordinator: NSObject {
  var canvasView: Binding<PKCanvasView>
    var onSave: () -> Void

  // MARK: - Initializers
    init(canvasView: Binding<PKCanvasView>, onSave: @escaping () -> Void) {
    self.canvasView = canvasView
      self.onSave = onSave
  }
}

// MARK: - PKCanvasViewDelegate
extension Coordinator: PKCanvasViewDelegate {
  func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
      if !canvasView.drawing.bounds.isEmpty {
          onSave()
      }
  }
}
