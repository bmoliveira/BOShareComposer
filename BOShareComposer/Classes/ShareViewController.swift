//
//  ShareViewController.swift
//  BOShareComposer
//
//  Created by Bruno Oliveira on 19/07/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit

public extension BOShareViewController {
  public static func presentShareViewController(from viewController: UIViewController,
                                                     shareViewModel: ShareViewModel,
                                                     shareDelegate: ShareDelegate,
                                                     completion: (()->())? = nil) {

    viewController.navigationController?.modalPresentationStyle = .OverCurrentContext
    viewController.modalPresentationStyle = .OverCurrentContext
    let shareViewController = BOShareViewController()
    shareViewController.shareDelegate = shareDelegate
    shareViewController.viewModel = shareViewModel

    viewController.presentViewController(shareViewController,
                                         animated: false,
                                         completion: completion)
  }
}

public class BOShareViewController: UIViewController {

  var viewModel: ShareViewModel?
  var shareDelegate: ShareDelegate?

  lazy var cancelButton: UIButton = {
    let button = UIButton(type: UIButtonType.System)
    button.setTitle("Cancel", forState: .Normal)
    button.addTarget(self, action: #selector(cancelAction), forControlEvents: .TouchUpInside)
    return button
  }()

  lazy var confirmButton: UIButton = {
    let button = UIButton(type: UIButtonType.System)
    button.setTitle("Send", forState: .Normal)
    button.addTarget(self, action: #selector(sendAction), forControlEvents: .TouchUpInside)
    return button
  }()

  lazy var popupTitle: UILabel = {
    let label = UILabel()
    label.text = "Share"
    return label
  }()

  lazy var titleDivider: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
    return view
  }()

  lazy var popupBody: UITextView = {
    let textField = UITextView()
    textField.editable = true
    textField.backgroundColor = UIColor.clearColor()
    textField.scrollEnabled = true
    textField.text = "A random message to send to a dummy user!"
    textField.font = UIFont.systemFontOfSize(18)
    textField.becomeFirstResponder()
    return textField
  }()

  lazy var backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
    return view
  }()

  lazy var containerView: UIVisualEffectView = {
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .ExtraLight))
    visualEffectView.layer.cornerRadius = 8
    visualEffectView.clipsToBounds = true
    visualEffectView.alpha = 0
    return visualEffectView
  }()

  override public func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  public override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    shareDelegate?.willAppear()
    popupTitle.text = viewModel?.title ?? ""
    popupBody.text = viewModel?.text ?? ""
    showView()
  }

  public override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    shareDelegate?.willDisapear()
    hideView()
  }

  func cancelAction() {
    hideView { _ in
      self.dismissViewControllerAnimated(false, completion: nil)
    }
  }

  func sendAction() {
    if var viewModel = viewModel {
      viewModel.text = popupBody.text
      shareDelegate?.submit(viewModel)
    }
    hideView { _ in
      self.dismissViewControllerAnimated(false, completion: nil)
    }
  }
}



extension BOShareViewController {

  private func showView() {
    UIView.animateWithDuration(0.5) {
      self.containerView.alpha = 1
    }
  }

  private func hideView(completion: ((Bool)->())? = nil) {
    popupBody.resignFirstResponder()
    UIView.animateWithDuration(0.5) {
      self.backgroundView.alpha = 0
    }

    UIView.animateWithDuration(0.5,
                               animations: {
                                self.containerView.alpha = 0
      },
                               completion: completion)
  }

  private func setupViews() {
    view.backgroundColor = UIColor.whiteColor()
    view.addSubview(backgroundView)
    backgroundView.snp.makeConstraints { make in
      make.edges.equalTo(self.view)
    }

    view.addSubview(containerView)

    containerView.snp.makeConstraints { make in
      make.top.equalTo(backgroundView).inset(60)
      make.left.equalTo(backgroundView).inset(16)
      make.right.equalTo(backgroundView).inset(16)
    }

    let contentView = containerView.contentView
    contentView.addSubview(cancelButton)
    cancelButton.snp.makeConstraints { make in
      make.top.equalTo(contentView).inset(4)
      make.left.equalTo(contentView).inset(8)
    }

    contentView.addSubview(confirmButton)
    confirmButton.snp.makeConstraints { make in
      make.top.equalTo(contentView).inset(4)
      make.right.equalTo(contentView).inset(8)
    }

    contentView.addSubview(titleDivider)
    titleDivider.snp.makeConstraints { make in
      make.top.equalTo(cancelButton.snp.bottom)
      make.left.equalTo(contentView)
      make.right.equalTo(contentView)
      make.height.equalTo(1)
    }

    contentView.addSubview(popupTitle)
    popupTitle.snp.makeConstraints { make in
      make.top.equalTo(contentView)
      make.bottom.equalTo(titleDivider.snp.top)
      make.centerX.equalTo(contentView)
      make.left.equalTo(cancelButton.snp.right).priorityLow()
      make.right.equalTo(confirmButton.snp.left).priorityLow()
    }

    let dummyContentView = UIView()
    contentView.addSubview(dummyContentView)
    dummyContentView.snp.makeConstraints { make in
      make.top.equalTo(titleDivider.snp.bottom)
      make.left.equalTo(contentView).inset(8)
      make.right.equalTo(contentView).inset(8)
      make.bottom.equalTo(contentView).inset(8)
      make.height.equalTo(140)
    }

    dummyContentView.addSubview(popupBody)
    popupBody.snp.makeConstraints { make in
      make.top.equalTo(dummyContentView)
      make.left.equalTo(dummyContentView)
      make.right.equalTo(dummyContentView)
      make.bottom.equalTo(dummyContentView)
    }
  }
}