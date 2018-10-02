//
//  QuickCreate.swift
//  CleanUIKit
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//
//  reference: https://itnext.io/refactoring-in-swift-setup-closures-d06b896c412c

public typealias Setup<T> = (T) -> Void

public func create<T>(_ setup: Setup<T>? = nil) -> T where T: NSObject {
  let obj = T()
  setup?(obj)
  return obj
}

public func create<T>(_ setup: Setup<T>? = nil) -> T where T: UITableView {
  let tableView = T(frame: .zero, style: .plain)
  tableView.rowHeight = UITableViewAutomaticDimension
  tableView.estimatedRowHeight = 44
  tableView.tableFooterView = UIView(frame: .zero)
  setup?(tableView)
  return tableView
}

public func create<T: UITableView>(superview: UIView, target: UITableViewDataSource & UITableViewDelegate, _ setup: Setup<T>?) -> T {
  return create { tableView in
    superview.addSubview(tableView)
    tableView.dataSource = target
    tableView.delegate = target
    setup?(tableView)
  }
}
