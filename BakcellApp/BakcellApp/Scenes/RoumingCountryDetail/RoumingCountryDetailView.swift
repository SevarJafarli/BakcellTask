//
//  RoumingCountryDetailView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit
import BakcellUIKit

protocol RoumingCountryDetailViewDelegate: AnyObject {
    
}

final class RoumingCountryDetailView: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    
    weak var delegate: RoumingCountryDetailViewDelegate?
    lazy var backViewForCollectionView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.appWhite)
        return view
    }()
    
    lazy var categoriesCollectionView: CategoriesCollectionView = {
        let collectionView = CategoriesCollectionView()
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier) 
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var operatorsView: OperatorsView = {
        let view = OperatorsView()
        view.backgroundColor = .clear
        return view
    }()
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.backViewForCollectionView.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
        self.categoriesCollectionView.snp.updateConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.operatorsView.snp.updateConstraints { make in
            make.top.equalTo(self.categoriesCollectionView.snp.bottom).offset(24)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.backViewForCollectionView.addSubview(self.categoriesCollectionView)
        self.addSubview(self.backViewForCollectionView)
        self.addSubview(self.operatorsView)
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.greyBg)
    }

}
