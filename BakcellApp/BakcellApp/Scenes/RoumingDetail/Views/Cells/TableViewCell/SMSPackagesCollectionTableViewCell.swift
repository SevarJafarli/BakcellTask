//
//  SMSPackagesCollectionTableViewCell.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 16.02.24.
//

import UIKit

class SMSPackagesCollectionTableViewCell: UITableViewCell {
    
    static var reuseIdentifier = "SMSPackagesCollectionTableViewCell"
    
    var smsPackageModels = [SMSPackageModel]()
    
    lazy var smsPackagesCollectionView: PackagesCollectionView = {
        let collectionView = PackagesCollectionView()
        collectionView.register(RoumingPackageViewCell.self, forCellWithReuseIdentifier: RoumingPackageViewCell.reuseIdentifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        self.smsPackagesCollectionView.delegate = self
        self.smsPackagesCollectionView.dataSource = self
        
        self.addSubviews()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func addSubviews() {
        self.contentView.addSubview(self.smsPackagesCollectionView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.smsPackagesCollectionView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(136 + 24 + 16)
            make.width.equalToSuperview()
        }
    }
    
    //MARK: Public
    
    public func configure(with models: [SMSPackageModel]) {
        self.smsPackageModels = models
//        self.smsPackagesCollectionView.reloadData()
    }
}

extension SMSPackagesCollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return self.smsPackageModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoumingPackageViewCell.reuseIdentifier, for: indexPath) as? RoumingPackageViewCell else {
            return UICollectionViewCell()
        }
        
      
        let model = self.smsPackageModels[indexPath.row]
        
        cell.configure(model: model as PackageModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 40) / 2, height: 136)
    }
}
