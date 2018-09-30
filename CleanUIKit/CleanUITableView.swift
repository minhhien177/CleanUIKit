//
//  CleanUITableView.swift
//  CleanUIKit
//
//  Created by Hien Vo Minh on 30/9/18.
//

import UIKit

public func create<T: UITableView>(_ setup: ((T) -> Void)) -> T {
  let tableView = T()
  tableView.rowHeight = UITableViewAutomaticDimension
  tableView.estimatedRowHeight = 44
  tableView.tableFooterView = UIView(frame: .zero)
  setup(tableView)
  return tableView
}

public func create<T: UITableView>(superview: UIView, target: UITableViewDataSource & UITableViewDelegate, _ setup: ((T) -> Void)) -> T {
  return create { tableView in
    superview.addSubview(tableView)
    tableView.dataSource = target
    tableView.delegate = target
    setup(tableView)
  }
}

public extension UITableView {
  public var reuse: ReuseUITableViewHelper {
    return ReuseUITableViewHelper(tableView: self)
  }
}

public struct ReuseUITableViewHelper {
  let tableView: UITableView

  public func register(_ cellClass: AnyClass, tag: String = "") {
    let identifer = String(describing: cellClass) + tag
    tableView.register(cellClass, forCellReuseIdentifier: identifer)
  }

  public func registerAll(_ cellClasses: AnyClass...) {
    for cellClass in cellClasses {
      register(cellClass)
    }
  }

  public func dequeue(_ cellClass: AnyClass, tag: String = "") -> UITableViewCell? {
    let identifier = String(describing: cellClass) + tag
    return tableView.dequeueReusableCell(withIdentifier: identifier)
  }

  public func dequeue<AnyCell: UITableViewCell>(tag: String = "", _ setup: (AnyCell) -> Void) -> UITableViewCell {
    let identifier = String(describing: AnyCell.self) + tag
    if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? AnyCell {
      setup(cell)
      return cell
    } else {
      return UITableViewCell()
    }
  }
}
