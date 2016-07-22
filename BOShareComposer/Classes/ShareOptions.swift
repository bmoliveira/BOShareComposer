//
//  ShareOptions.swift
//  Pods
//
//  Created by Bruno Oliveira on 20/07/16.
//
//

import Foundation

public struct ShareOptions {

  // Buttons tint color
  public var tintColor: UIColor

  // Composer title
  public var title: String

  // Dismiss button text
  public var dismissText: String

  // Completion button text
  public var confirmText: String

  // Parse link metadata and show image
  public var showMetadata = true

  // Keyboard appearence
  public var keyboardAppearance: UIKeyboardAppearance

  public init (tintColor: UIColor = UIView().tintColor, title: String = "Share", dismissText: String = "Cancel",
               confirmText: String = "Send", showMetadata: Bool = true,
               keyboardAppearance: UIKeyboardAppearance = .Dark) {
    self.tintColor = tintColor
    self.title = title
    self.dismissText = dismissText
    self.confirmText = confirmText
    self.showMetadata = showMetadata
    self.keyboardAppearance = keyboardAppearance
  }
}
