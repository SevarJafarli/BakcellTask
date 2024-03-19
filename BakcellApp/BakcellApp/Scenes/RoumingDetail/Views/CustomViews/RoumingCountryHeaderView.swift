//
//  RoumingCountryTableViewCell.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 22.02.24.
//

import UIKit
import BakcellUIKit

protocol RoumingCountryHeaderViewDelegate: AnyObject {
    func didSelectCountry(country: String)
}

class RoumingCountryHeaderView: UIView {
    
    var items: [String: String] = [:] {
        didSet {
            self.roumingCountriesCollectionView.reloadData()
            self.roumingCountriesCollectionView.invalidateIntrinsicContentSize()
        }
    }
    
    weak var delegate: RoumingCountryHeaderViewDelegate?
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.appWhite)
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.clipsToBounds = true
        return view
    }()
    
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
    
    private lazy var roumingCountriesCollectionView:  RoumingCountriesCollectionView = {
        let collectionView = RoumingCountriesCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RoumingCountryViewCell.self, forCellWithReuseIdentifier: RoumingCountryViewCell.reuseIdentifier)
        
        return collectionView
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func addSubviews() {
        self.addSubview(self.backView)
        self.backView.addSubview(self.bgImageView)
        self.backView.addSubview(self.titleLabel)
        self.backView.addSubview(self.searchTextField)
        self.backView.addSubview(self.roumingCountriesCollectionView)

        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.backView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            
        }
        
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
            make.height.equalTo(100)
            make.bottom.equalToSuperview()
        }
    }
}

//MARK: UICollectionViewDelegate
extension RoumingCountryHeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoumingCountryViewCell.reuseIdentifier, for: indexPath) as? RoumingCountryViewCell else {
            return UICollectionViewCell()
        }
        let countries = items.values.map { $0 }
       
        cell.data = countries[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let countries = items.values.map { $0 }
       
        let country = countries[indexPath.row]
        delegate?.didSelectCountry(country: country)
    }
}
