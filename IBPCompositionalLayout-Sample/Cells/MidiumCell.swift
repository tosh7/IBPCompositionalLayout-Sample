//
//  MidiumCell.swift
//  IBPCompositionalLayout-Sample
//
//  Created by Satoshi Komatsu on 2021/01/31.
//

import UIKit
import Ikemen
import NorthLayout

final class MidiumCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        let autolayout = contentView.northLayoutFormat([:], [
                                                        "l": UILabel() ※ {
                                                            $0.text = "タイトル"
                                                        }
        ])
        autolayout("H:|-20-[l]-20-|")
        autolayout("V:|-30-[l]")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
