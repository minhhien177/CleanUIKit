//
//  CleanUITableView.swift
//  CleanUIKit
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

public extension CleanViewHelper where T: UITableView {
  public func set(target: UITableViewDataSource & UITableViewDelegate) {
    view.dataSource = target
    view.delegate = target
  }

  public func register(_ cellClass: AnyClass, tag: String = "") {
    let identifer = String(describing: cellClass) + tag
    view.register(cellClass, forCellReuseIdentifier: identifer)
  }

  public func registerAll(_ cellClasses: AnyClass...) {
    for cellClass in cellClasses {
      register(cellClass)
    }
  }

  public func dequeue(_ cellClass: AnyClass, tag: String = "") -> UITableViewCell? {
    let identifier = String(describing: cellClass) + tag
    return view.dequeueReusableCell(withIdentifier: identifier)
  }

  public func dequeue<AnyCell: UITableViewCell>(tag: String = "", _ setup: (AnyCell) -> Void) -> UITableViewCell {
    let identifier = String(describing: AnyCell.self) + tag
    if let cell = view.dequeueReusableCell(withIdentifier: identifier) as? AnyCell {
      setup(cell)
      return cell
    } else {
      return UITableViewCell()
    }
  }
}
