//
//  UIImage+Download.swift
//  Pods
//
//  Created by Bruno Oliveira on 20/07/16.
//
//

import UIKit

extension UIImageView {

  func setImage(withUrl url: NSURL) {
    var session = NSURLSession.sharedSession()
    let request = NSMutableURLRequest(URL: url, cachePolicy: .ReturnCacheDataElseLoad,
                                      timeoutInterval: 10)
    var task = session.dataTaskWithRequest(request) { (data, response, error) in
      dispatch_async(dispatch_get_main_queue()) {
        guard let data = data where error == nil else {
          self.image = nil
          return
        }
        self.fadeSetImage(UIImage(data: data))
      }
    }
    task.resume()
  }

  func fadeSetImage(image:UIImage?)
  {
    UIView.transitionWithView(self,
                              duration: 0.3,
                              options: .TransitionCrossDissolve,
                              animations: {
                                self.image = image
      }, completion: nil)
  }
}
