import UIKit

struct MidiumCellSection: Section {

    var didSelectItem: ((Int) -> Void)?

    var numberOfItems: Int {
        return 1
    }

    func layoutSection() -> NSCollectionLayoutSection {

        // Itemについてのレイアウト設定
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // groupについてのレイアウト設定
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // Sectionについてのレイアウト設定
        let section = NSCollectionLayoutSection(group: group)
//        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        // ここでスクロールストップするのか、しないのかの設定を行う
//        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary

        return section
    }

    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MidiumCell.self), for: indexPath) as! MidiumCell
        // ここでCellの設定を行う

        return cell
    }
}
