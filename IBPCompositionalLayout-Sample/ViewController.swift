//
//  ViewController.swift
//  IBPCompositionalLayout-Sample
//
//  Created by Satoshi Komatsu on 2021/01/30.
//

import UIKit
import Ikemen
import NorthLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    private lazy var collectionView: UICollectionView = .init() ※ {
        $0.dataSource = self
        $0.delegate = self
    }

    // Sectionのレイアウトをここでセットできる形にする
    private var collectionViewLayout: UICollectionViewLayout {
        let sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }

    private var sections: [Section] = [] {
        didSet {
            // sectionsが更新されたらレイアウトも更新する
            collectionView.collectionViewLayout = collectionViewLayout
            collectionView.reloadData()
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
}

// delegateの設定
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let didSelectItem = sections[indexPath.section].didSelectItem else {
            return
        }
        didSelectItem(indexPath.row)
    }
}

