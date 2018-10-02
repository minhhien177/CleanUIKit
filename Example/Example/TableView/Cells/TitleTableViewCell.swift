//
//  TitleTableViewCell.swift
//  Example
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import UIKit
import CleanUIKit
import SnapKit

final class TitleTableViewCell: UITableViewCell {

  private lazy var titleLabel: UILabel = contentView.clean.add { label in
    label.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(16)
    }
  }

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(title: String) {
    titleLabel.text = title
  }
  
}
