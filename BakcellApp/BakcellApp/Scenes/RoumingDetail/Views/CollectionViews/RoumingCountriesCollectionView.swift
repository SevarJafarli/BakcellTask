//
//  RoumingCountriesCollectionView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 21.02.24.
//

import UIKit

class RoumingCountriesCollectionView: UICollectionView {
    
    //MARK: Init
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = CollectionViewCenteredFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        layout.sectionInset = .init(top: 0, left: 16, bottom: 16, right: 16)

        super.init(frame: frame, collectionViewLayout: layout)
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
        self.isScrollEnabled = false
        self.setContentHuggingPriority(.defaultHigh, for: .vertical)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
