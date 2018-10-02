//
//  CleanUIView.swift
//  CleanUIKit
//
//  Created by Hien Vo Minh on 1/10/18.
//  Copyright © 2018 vomh. All rights reserved.
//

public protocol CleanCompatible {}
extension UIView: CleanCompatible { }

public extension CleanCompatible {
  public var clean: CleanViewHelper<Self> {
    return CleanViewHelper(view: self)
  }
}

public struct CleanViewHelper<T> {
  let view: T
}

extension CleanViewHelper where T: UIView {
  public func add<T>(_ setup: Setup<T>? = nil) -> T where T: UIView {
    return create { [unowned view] (subview: T) in
      view.addSubview(subview)
      setup?(subview)
    }
  }

  public func show(duration: TimeInterval = 0) {
    view.isHidden = false
    if duration > 0 {
      view.alpha = 0
      UIView.animate(withDuration: duration) {
        self.view.alpha = 1
      }
    }
  }

  public func hide(duration: TimeInterval = 0) {
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
