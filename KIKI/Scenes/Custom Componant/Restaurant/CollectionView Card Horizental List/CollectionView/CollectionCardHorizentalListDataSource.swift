//
//  CollectionCardHorizentalListDataSource.swift
//  KIKI
//
//  Created by Fares Ajimi on 9/12/2021.
//

import UIKit

class CollectionCardHorizentalListDataSource: NSObject, UICollectionViewDataSource {

    // MARK: - Properties

    var items: [RestaurantCollectionModel] = []

    // MARK: - CollectionView DataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionCardHorizentalListViewCell.identifier,
            for: indexPath
        ) as? CollectionCardHorizentalListViewCell else {
            return .init()
        }
        let item = items[indexPath.row]
        cell.configure(item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView
                .dequeueReusableSupplementaryView(ofKind: kind,
                                                  withReuseIdentifier: "CollectionCardHorizentalListFooter",
                                                  for: indexPath)
            return footerView
        default:
            return UICollectionReusableView()
        }
    }
}
