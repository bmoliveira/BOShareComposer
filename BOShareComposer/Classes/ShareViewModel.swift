//
//  ShareViewModel.swift
//  Pods
//
//  Created by Bruno Oliveira on 19/07/16.
//
//

import Foundation

public struct ShareViewModel {
  public var text: String
  public let link: NSURL?
  public let title: String
  public let destinationUserId: String?

  public init(text: String, title: String = "Share", link: NSURL? = nil, destinationUserId: String? = nil){
    self.text = text
    self.title = title
    self.link = link
    self.destinationUserId = destinationUserId
  }
}
