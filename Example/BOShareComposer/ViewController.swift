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

  lazy var shareViewModel: ShareViewModel = {
    return ShareViewModel(text: "asdas")
  }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  @IBAction func share(sender: AnyObject) {
    BOShareViewController.presentShareViewController(from: self,
                                                     shareViewModel: shareViewModel,
                                                     shareDelegate: self)
  }
}

extension ViewController: ShareDelegate {
  func willAppear() {
    print("will appear")
  }

  func submit(viewModel: ShareViewModel) {
    print("\(viewModel)")
  }

  func willDisapear() {
    print("will disapear")
  }
}