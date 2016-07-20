//
//  OpenGraph.swift
//  Pods
//
//  Created by Bruno Oliveira on 20/07/16.
//
//

import Foundation

public struct OpenGraph {

  public let description: String?
  public let title: String?
  public let imageURL: NSURL?

  // MARK: HTML
  init?(html: String) {
    guard let parser = HTMLParser(html: html) else { return nil }

    title = parser.contentFromMetatag("og:title")
    description = parser.contentFromMetatag("og:description")

    if let imageMeta = parser.contentFromMetatag("og:image") {
      imageURL = NSURL(string: imageMeta)
    } else {
      imageURL = nil
    }
  }
}

extension OpenGraph {
  static func fetchMetadata(url: NSURL, completion: (OpenGraph?) -> Void) {
    executeRequest(url: url) { html in
      guard let html = html else {
        completion(nil)
        return
      }
      completion(OpenGraph(html: html))
    }
  }

  private static func executeRequest(url url: NSURL, completion: (String?) -> ()) {
    let session = NSURLSession.sharedSession()

    let request = NSMutableURLRequest(URL: url, cachePolicy: .ReturnCacheDataElseLoad,
                                      timeoutInterval: 10)
    request.setValue("Facebot", forHTTPHeaderField: "User-Agent")
    let task = session.dataTaskWithRequest(request) { (data, response, error) in
      guard let data = data where error == nil else {
        completion(nil)
        return
      }
      completion(String(data: data, encoding: NSASCIIStringEncoding))
    }
    task.resume()
  }
}
