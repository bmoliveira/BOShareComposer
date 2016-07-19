//
//  BOShareDelegate.swift
//  Pods
//
//  Created by Bruno Oliveira on 19/07/16.
//
//

import Foundation

public protocol ShareDelegate {
  // Modal will appear
  func willAppear()

  // When share is submited
  func submit(viewModel: ShareViewModel)

  // Modal will be dismissed
  func willDisapear()
}
