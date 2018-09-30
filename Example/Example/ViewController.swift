//
//  ViewController.swift
//  Example
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import UIKit
import CleanUIKit
import SnapKit

final class ViewController: UIViewController {

  private lazy var tableView: UITableView = create(superview: view, target: self) { tableView in
    tableView.reuse.registerAll(TitleTableViewCell.self,
                                SubtitleTableViewCell.self)
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.reloadData()
  }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let random = Int(arc4random())
    let title = String(random)
    if random % 2 == 0 {
      return tableView.reuse.dequeue { (cell: TitleTableViewCell) in cell.update(title: title) }
    } else {
      return tableView.reuse.dequeue { (cell: SubtitleTableViewCell) in cell.update(title: title, subtitle: "Opps! It's an odd number!") }
    }
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
}
