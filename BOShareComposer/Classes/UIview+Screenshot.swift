//
//  UIview+Screenshot.swift
//  Pods
//
//  Created by Bruno Oliveira on 20/07/16.
//
//

import UIKit

extension UIView{

  var screenshot: UIImage? {
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.mainScreen().scale)
    drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
}