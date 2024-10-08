//
//  ShareSheet.swift
//  PhotoEditor
//
//  Created by Vladimir on 18.09.2024.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
  // MARK: - Type alias
  typealias Callback = (
    _ activityType: UIActivity.ActivityType?,
    _ completed: Bool,
    _ returnedItems: [Any]?,
    _ error: Error?) -> Void

  // MARK: - Properties
  var activityItems: [Any]
  var applicationActivities: [UIActivity]?
  var excludedActivityTypes: [UIActivity.ActivityType]?
  var callback: Callback?

  func makeUIViewController(context: Context) -> UIActivityViewController {
    let controller = UIActivityViewController(
      activityItems: activityItems,
      applicationActivities: applicationActivities)
    controller.excludedActivityTypes = excludedActivityTypes
    controller.completionWithItemsHandler = callback
    return controller
  }

  func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
  }
}

struct ShareSheet_Previews: PreviewProvider {
  static var previews: some View {
    let theShareSheet = ShareSheet(
      activityItems: ["A preview string" as NSString],
      excludedActivityTypes: [UIActivity.ActivityType.airDrop])
    return theShareSheet
  }
}
