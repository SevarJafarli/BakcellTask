//
//  PackageDetailISingleInfoView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 28.02.24.
//

import UIKit
import BakcellUIKit

class PackageDetailISingleInfoView: UIStackView {
    
    let data: RoumingPackageDetailInfoModel
    
    var isFreeService = false
    
    
    private lazy var primerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 12
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldSubheadline.fontStyle
        lbl.textColor = adaptiveColor(.blackHigh)
        return lbl
    }()
    
    private lazy var trailingLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldTitle3.fontStyle
        lbl.textColor = adaptiveColor(.blackHigh)
        return lbl
    }()
    
    private lazy var iconView: PackageIconView = {
        let view = PackageIconView()
        return view
    }()
    
    private lazy var freeServiceIconView: UIImageView  = {
        let view = UIImageView()
        return view
    }()
    
    //MARK: Init
    init(data: RoumingPackageDetailInfoModel) {
        self.data = data
        
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = 0
        self.distribution = .equalSpacing
        self.configure()
        self.addSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        if self.isFreeService {
            self.primerStackView.addArrangedSubview(self.freeServiceIconView)
        } 
        else {
            self.primerStackView.addArrangedSubview(self.iconView)
        }
      
        self.primerStackView.addArrangedSubview(self.titleLabel)
        
        self.addArrangedSubview(self.primerStackView)
        self.addArrangedSubview(self.trailingLabel)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if self.isFreeService {
            self.freeServiceIconView.snp.updateConstraints { make in
                make.width.height.equalTo(40)
            }
            
        } else {
            self.iconView.snp.updateConstraints { make in
                make.width.height.equalTo(40)
            }
        }
    }
    
    private func configure() {
        self.isFreeService = data.modelType == .freeServices
        if self.isFreeService {
            self.freeServiceIconView.image = data.modelType.icon
            
        }
        else {
            self.iconView.image = data.modelType.icon
        }
        self.titleLabel.text = data.modelType.title
        if  let amountType = data.amountType {
            self.trailingLabel.makePackageAmountLabel2(amount: data.amount, amountType: amountType)
        }
        else {
            self.trailingLabel.text = data.amount
        }
    }
}
