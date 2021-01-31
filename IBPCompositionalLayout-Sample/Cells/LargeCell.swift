//
//  LargeCell.swift
//  IBPCompositionalLayout-Sample
//
//  Created by Satoshi Komatsu on 2021/01/31.
//

import UIKit

final class LargeCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.contentView.backgroundColor = UIColor.red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
