//
//  ShareViewModel.swift
//  Pods
//
//  Created by Bruno Oliveira on 19/07/16.
//
//

import Foundation

public struct ShareContent {
  // Starting text - and after a send is tapped the resulting text of user input
  public var text: String

  // If you want to specify a URL to the content - This url does no show in the editor
  public let link: NSURL?

  // If you are sending a message to a specific user add it here
  public let destinationUserId: String?

  public init(text: String, link: NSURL? = nil, destinationUserId: String? = nil) {
    self.text = text
    self.link = link
    self.destinationUserId = destinationUserId
  }
}
