//
//  RoumingPackageInfoCardView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 28.02.24.
//

import UIKit
import BakcellUIKit

class RoumingPackageInfoCardView: UIView {
    
    var data: RoumingPackageDetailCardModel? {
        didSet {
            configure()
        }
    }
    
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 24
        return view
    }()
    
    private lazy var headerStackView: PackageCardHeaderView = {
        let view = PackageCardHeaderView()
        return view
    }()
    
    
    private lazy var packageInfoStackView: PackageDetailInfoStackView = {
        let view = PackageDetailInfoStackView()
    
        return view
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
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.contentStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.appWhite)
        self.layer.cornerRadius = 24
        self.layer.borderColor = adaptiveColor(.greyLight1).cgColor
        self.layer.borderWidth = 2
        self.layer.masksToBounds = true
    }
    
    
    private func addSubviews() {
    
        self.contentStackView.addArrangedSubview(self.headerStackView)
        
        self.contentStackView.addArrangedSubview(self.packageInfoStackView)
        
        self.addSubview(self.contentStackView)
        
        self.updateConstraints()
    }
    
    private func configure() {
        guard let data = data else { return }
        self.headerStackView.data = (data.packageType, data.packageAmount, data.packageAmountType)
        self.packageInfoStackView.data = data.infoModels
    }
    
}
