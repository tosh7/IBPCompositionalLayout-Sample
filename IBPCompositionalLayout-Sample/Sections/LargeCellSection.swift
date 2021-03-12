//
//  LargeCellSection.swift
//  IBPCompositionalLayout-Sample
//
//  Created by Satoshi Komatsu on 2021/01/31.
//

import UIKit

struct LargeCellSection: Section {

    var didSelectItem: ((Int) -> Void)?

    var numberOfItems: Int {
        return 10
    }

    func layoutSection() -> NSCollectionLayoutSection {

        // Itemについてのレイアウト設定
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // groupについてのレイアウト設定
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width - 40), heightDimension: .absolute(184))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // Sectionについてのレイアウト設定
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        // ここでスクロールストップするのか、しないのかの設定を行う
        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }

    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LargeCell.self), for: indexPath) as! LargeCell
        // ここでCellの設定を行う

        return cell
    }
}
