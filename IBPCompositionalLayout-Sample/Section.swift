//
//  Section.swift
//  IBPCompositionalLayout-Sample
//
//  Created by Satoshi Komatsu on 2021/01/31.
//

import UIKit

protocol Section {
    // 各セクションにおくアイテムの数
    var numberOfItems: Int { get }
    // 各セクションのアイテムがタップされた際の処理
    // クロージャーで設定をしておくと、VC側から処理を追加できる
    var didSelectItem: ((Int) -> Void)? { get }
    // ここで、実際にレイアウトを組んでいきます
    func layoutSection() -> NSCollectionLayoutSection
    // Itemとして使用するCellの設定はここで行います。
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
