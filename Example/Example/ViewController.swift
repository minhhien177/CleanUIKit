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

  private let label: UILabel = create { label in
    label.text = "Hello World!"
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(label)
    label.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }

}

