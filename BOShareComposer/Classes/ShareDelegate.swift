//
//  BOShareDelegate.swift
//  Pods
//
//  Created by Bruno Oliveira on 19/07/16.
//
//

import Foundation

public protocol ShareDelegate {
  func willAppear()
  func submit(viewModel: ShareViewModel)
  func willDisapear()
}
