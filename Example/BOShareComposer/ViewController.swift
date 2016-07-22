//
//  ViewController.swift
//  BOShareComposer
//
//  Created by Bruno Oliveira on 07/19/2016.
//  Copyright (c) 2016 Bruno Oliveira. All rights reserved.
//

import UIKit
import BOShareComposer

class ViewController: UIViewController {

  lazy var shareContentWithMetaData: ShareContent = {
    return ShareContent(
      text: "Sample site that implements facebook metatags",
      link: NSURL(string: "https://medium.com/@samvlu/100-days-of-swift-736d45a19b63#.a1llu43fd")!
    )
  }()

  lazy var shareContentWithoutMetaData: ShareContent = {
    return ShareContent(
      text: "We don't have metadata so we show the web page",
      link: NSURL(string: "https://news.ycombinator.com/")!
    )
  }()

  lazy var shareOptions: ShareOptions = {
    return ShareOptions(tintColor: UIColor.redColor(), title: "Custom long text title that does not fit", dismissText: "Dismiss",
                        confirmText: "Confirm", showMetadata: true)
  }()

  lazy var shareOptionsNoMetadata: ShareOptions = {
    return ShareOptions(tintColor: UIColor.redColor(), title: "Custom title", dismissText: "Dismiss",
                        confirmText: "Confirm", showMetadata: false)
  }()

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func shareWithoutData(sender: AnyObject) {
    ShareViewController
      .presentShareViewController(from: self,
                                  shareContent: shareContentWithoutMetaData,
                                  options: shareOptionsNoMetadata) { (completed, shareContent) in
                                    print(shareContent)
    }
  }

  @IBAction func shareWithoutMetadata(sender: AnyObject) {
    ShareViewController
      .presentShareViewController(from: self,
                                  shareContent: shareContentWithoutMetaData,
                                  options: shareOptions) { (completed, shareContent) in
                                    print(shareContent)
    }
  }

  @IBAction func share(sender: AnyObject) {
    ShareViewController
      .presentShareViewController(from: self,
                                  shareContent: shareContentWithMetaData,
                                  options: shareOptions) { (completed, shareContent) in
                                    print(shareContent)
    }
  }
}
