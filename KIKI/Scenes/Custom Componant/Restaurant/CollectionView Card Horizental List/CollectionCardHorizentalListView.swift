//
//  CollectionCardHorizentalListView.swift
//  KIKI
//
//  Created by Fares Ajimi on 9/12/2021.
//

import UIKit

class CollectionCardHorizentalListView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var collectionView: UICollectionView!
    lazy private var collectionCardHorizentalListFooter: CollectionCardHorizentalListFooter? = .fromNib()

    // MARK: - Properties

    var dataSource: CollectionCardHorizentalListDataSource?
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }

    // MARK: DI

    func set(items: [RestaurantCollectionModel]) {
        dataSource?.items = items
    }

    func set(dataSource: CollectionCardHorizentalListDataSource) {
        self.dataSource = dataSource
    }

    // MARK: View life cycle

    override func draw(_ rect: CGRect) {
        setUpCollectionView()
    }

    // MARK: UI

    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        collectionView.register(CollectionCardHorizentalListViewCell.nib,
                                forCellWithReuseIdentifier: CollectionCardHorizentalListViewCell.identifier)
        collectionView.register(CollectionCardHorizentalListFooter.nib,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: "CollectionCardHorizentalListFooter")
    }

    // MARK: - Init & loading view

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }

    func loadViewFromNib() -> UIView? {
        return CollectionCardHorizentalListView.nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
