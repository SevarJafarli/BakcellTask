//
//  RoamingTableViewHeader.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 20.02.24.
//

import UIKit
import BakcellUIKit

class RoamingTableViewHeader: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    private lazy var bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AppAssets.map.rawValue)
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldHeadline.fontStyle
        lbl.text = "Hara səyahət etmək istəyirsiniz?"
        lbl.textAlignment = .center
        lbl.textColor = adaptiveColor(.blackHigh)
        return lbl
    }()
    
    private lazy var searchTextField: CountrySearchView = {
        let view = CountrySearchView()
        return view
    }()
    
    let models: [String] = ["Turkiye", "Rusiya", "ABS", "Seudiiye Erebistan", "Almaniya", "Qazaxistan"]
    
    private lazy var roumingCountriesCollectionView:  RoumingCountriesCollectionView = {
        let collectionView = RoumingCountriesCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RoumingCountryButton.self, forCellWithReuseIdentifier: RoumingCountryButton.reuseIdentifier)
       
        return collectionView
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        self.addSubviews()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.appWhite)
    }
    
    private func addSubviews() {
        self.addSubview(self.bgImageView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.searchTextField)
        self.addSubview(self.roumingCountriesCollectionView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.bgImageView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalToSuperview().dividedBy(2)
        }
        
        self.titleLabel.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(48)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.searchTextField.snp.updateConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        self.roumingCountriesCollectionView.snp.updateConstraints { make in
            make.top.equalTo(self.searchTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
extension RoamingTableViewHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoumingCountryButton.reuseIdentifier, for: indexPath) as? RoumingCountryButton else {
            return UICollectionViewCell()
        }
        cell.configure(with: models[indexPath.row])
        return cell
    }
}
