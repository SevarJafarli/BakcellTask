//
//  PackageMoreInfoStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 28.02.24.
//

import UIKit


class PackageMoreInfosStackView: UIStackView {
    
    var data: [RoumingPackageMoreInfoModel]? {
        didSet {
            configure()
        }
    }

    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.spacing = 24
        self.axis = .vertical
    }
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        guard let data = data else { return }
        
        for model in data {
            let view = PackageSingleMoreInfoStackView()
            view.data = model
            
            self.addArrangedSubview(view)
            
            self.updateConstraints()
        }
    }
}
