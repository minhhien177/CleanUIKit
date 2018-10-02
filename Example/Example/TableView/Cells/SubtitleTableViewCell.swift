//
//  SubtitleTableViewCell.swift
//  Example
//
//  Created by Hien Vo Minh on 1/10/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import UIKit
import CleanUIKit

class SubtitleTableViewCell: UITableViewCell {

  private lazy var titleLabel: UILabel = contentView.clean.add { label in
    label.snp.makeConstraints { make in
      make.top.left.right.equalToSuperview().inset(16)
    }
  }

  private lazy var subtitleLabel: UILabel = contentView.clean.add { [unowned titleLabel] label in
    label.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom)
      make.left.right.equalTo(titleLabel)
      make.bottom.equalToSuperview().inset(16)
    }
  }

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    titleLabel.clean.show()
    subtitleLabel.clean.show()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(title: String, subtitle: String) {
    titleLabel.text = title
    subtitleLabel.text = subtitle
  }

}
