//
//  QuickCreate.swift
//  CleanUIKit
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//
//  reference: https://itnext.io/refactoring-in-swift-setup-closures-d06b896c412c

public func create<T>(_ setup: ((T) -> Void)) -> T where T: NSObject {
  let obj = T()
  setup(obj)
  return obj
}
