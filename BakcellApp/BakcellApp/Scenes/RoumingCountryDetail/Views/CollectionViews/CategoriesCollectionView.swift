//
//  CategoriesCollectionView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit

class CategoriesCollectionView: UICollectionView {

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = .zero
        super.init(frame: .zero, collectionViewLayout: layout)
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
