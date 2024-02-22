//
//  AllIncludedPackageInfoStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 21.02.24.
//

import UIKit

class AllIncludedPackageInfoHStackView: UIStackView {
    
    //MARK: Init
    fileprivate func setupStackView() {
        self.axis = .horizontal
        self.spacing = 24
        self.distribution = .fillEqually
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupStackView()

    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with models: [Package]) {
        for model in models {
            if let title = model.packageType {
                let packageView = AllPackageInfoVStackView(title: title, subtitle: "\(model.packageAmount) \(model.amountType)")
        
            self.removeArrangedSubview(packageView)
            self.addArrangedSubview(packageView)
            }
        }
    }
}
