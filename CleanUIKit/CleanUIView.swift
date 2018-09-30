//
//  CleanUIView.swift
//  CleanUIKit
//
//  Created by Hien Vo Minh on 1/10/18.
//

import UIKit

public func create<T>(superview: UIView, _ setup: ((T) -> Void)) -> T where T: UIView {
  let view = T()
  superview.addSubview(view)
  setup(view)
  return view
}

public extension UIView {
  var clean: CleanUIViewHelper {
    return CleanUIViewHelper(view: self)
  }
}

public struct CleanUIViewHelper {
  let view: UIView

  public func appear(duration: TimeInterval = 0) {
    view.isHidden = false
    if duration > 0 {
      view.alpha = 0
      UIView.animate(withDuration: duration) {
        self.view.alpha = 1
      }
    }
  }

  public func disappear(duration: TimeInterval = 0) {
    if duration > 0 {
      UIView.animate(withDuration: duration, animations: {
        self.view.alpha = 0
      }) { _ in
        self.view.isHidden = true
      }
    } else {
      view.isHidden = true
    }
  }
}
