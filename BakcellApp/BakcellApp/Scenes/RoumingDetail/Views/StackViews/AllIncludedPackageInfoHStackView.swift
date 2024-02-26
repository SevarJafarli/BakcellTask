//
//  AllIncludedPackageInfoStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 21.02.24.
//

import UIKit

class AllIncludedPackageInfoHStackView: UIStackView {
    
    var data: [Package]? = [] {
        didSet {
            configure()
        }
    }
    //MARK: Init
    fileprivate func setupStackView() {
        self.axis = .horizontal
        self.spacing = 24
//        self.distribution = .fillEqually
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupStackView()

    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
   
    func configure() {
        guard let data = data else { return }
        
        for model in data {
            if let title = model.packageType {
                let packageView = AllPackageInfoVStackView(title: title, subtitle: "\(model.packageAmount) \(model.amountType)")
        
            self.addArrangedSubview(packageView)
            }
        }
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
}
