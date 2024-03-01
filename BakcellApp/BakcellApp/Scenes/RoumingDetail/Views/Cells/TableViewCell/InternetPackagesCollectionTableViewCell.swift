//
//  InternetPackagesCollectionTableViewCell.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 16.02.24.
//

import UIKit

protocol InternetPackagesCollectionTableViewCellDelegate: AnyObject {
    func onPackageSelected()
}

class InternetPackagesCollectionTableViewCell: UITableViewCell {
    
    static var reuseIdentifier = "InternetPackagesCollectionTableViewCell"
    
    var internetPackageModels = [InternetPackageModel]()
    
    weak var delegate: InternetPackagesCollectionTableViewCellDelegate?
    
    lazy var internetPackagesCollectionView: PackagesCollectionView = {
        let collectionView = PackagesCollectionView()
        collectionView.register(RoumingPackageViewCell.self, forCellWithReuseIdentifier: RoumingPackageViewCell.reuseIdentifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        self.internetPackagesCollectionView.delegate = self
        self.internetPackagesCollectionView.dataSource = self
        self.addSubviews()
       
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.internetPackagesCollectionView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.internetPackagesCollectionView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(168 + 24 + 16)
            make.width.equalToSuperview()
        }
    }
    
    //MARK: Public
    
    public func configure(with models: [InternetPackageModel]) {
        self.internetPackageModels = models
        self.internetPackagesCollectionView.reloadData()
    }
}

extension InternetPackagesCollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return self.internetPackageModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoumingPackageViewCell.reuseIdentifier, for: indexPath) as? RoumingPackageViewCell else {
            return UICollectionViewCell()
        }
        
        //TODO: add model from viewmodel
        let model = self.internetPackageModels[indexPath.row]
         
        cell.configure(model: model as PackageModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 40) / 2, height: 168)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.onPackageSelected()
    }
}
