//
//  AllIncludedPackageInfoStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 21.02.24.
//

import UIKit

class AllIncludedPackageInfoHStackView: UIStackView {
    
    var data: [TypeElementModel] = [] {
        didSet {
            configure()
        }
    }
    //MARK: Init
    fileprivate func setupStackView() {
        self.axis = .horizontal
        self.spacing = 24
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupStackView()
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    
    func configure() {
        
        
        for model in data {
            let packageView = AllPackageInfoVStackView(title: model.name, subtitle: model.units)
            
            self.addArrangedSubview(packageView)
        }
        self.updateConstraints()
    }

    
    
    override func updateConstraints() {
        super.updateConstraints()
    }
}
