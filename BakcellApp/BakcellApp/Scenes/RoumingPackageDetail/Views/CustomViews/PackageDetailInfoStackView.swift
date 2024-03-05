//
//  PackageDetailInfoStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 28.02.24.
//

import UIKit

internal class PackageDetailInfoStackView: UIStackView {
    
    var data: [RoumingPackageDetailInfoModel]? {
        didSet {
            configure()
        }
    }
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.spacing = 16
    }

    
    required init(coder: NSCoder) {
        fatalError()
    }

    
    private func configure() {
        guard let data = data else { return }
        
        for item in data {
            let view = PackageDetailISingleInfoView(data: item)
//            view.data = item
            self.addArrangedSubview(view)
        }
    }
}
