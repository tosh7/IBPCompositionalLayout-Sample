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
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // Sectionについてのレイアウト設定
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        // ここでスクロールストップするのか、しないのかの設定を行う
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary

        // TODO: このメソッドはIBPCompositionalとの併用ができないので、IBPそのものの修正が必要あり
//        if #available(iOS 14, *) {
//            if #available(iOS 14.5, *) {} else {
//                section.visibleItemsInvalidationHandler = { visibleItems, _, _ in
//                    visibleItems.forEach { item in
//                        if item.indexPath.row == numberOfItems - 1 {
//                            section.orthogonalScrollingBehavior = .continuous
//                        }
//                    }
//                }
//            }
//        }

        return section
    }

    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LargeCell.self), for: indexPath) as! LargeCell
        // ここでCellの設定を行う

        return cell
    }
}
