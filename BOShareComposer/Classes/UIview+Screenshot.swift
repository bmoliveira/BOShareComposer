//
//  UIview+Screenshot.swift
//  Pods
//
//  Created by Bruno Oliveira on 20/07/16.
//
//

import UIKit

extension UIView{

  var screenshot: UIImage {

    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
    let context = UIGraphicsGetCurrentContext();
    self.layer.renderInContext(context!)
    let screenShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenShot
  }
}