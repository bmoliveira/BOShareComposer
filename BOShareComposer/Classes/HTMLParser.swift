//
//  HTMLParser.swift
//  Pods
//
//  Created by Bruno Oliveira on 20/07/16.
//
//

import Foundation
import Kanna

class HTMLParser {

  private let document: HTMLDocument

  init?(html: String) {
    guard let document = Kanna.HTML(html: html, encoding: NSUTF8StringEncoding) else { return nil }

    self.document = document
  }

  func contentFromMetatag(metatag: String) -> String? {
    return document.head?.xpath(xpathForMetatag(metatag)).first?["content"]
  }

  private func xpathForMetatag(metatag: String) -> String {
    return "//meta[@property='\(metatag)'] | //meta[@name='\(metatag)']"
  }
}
