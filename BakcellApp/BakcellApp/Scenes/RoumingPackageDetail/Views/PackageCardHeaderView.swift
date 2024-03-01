//
//  PackageCardHeaderView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 28.02.24.
//

import UIKit
import BakcellUIKit

class PackageCardHeaderView: UIStackView {
    
    
    var data: (title: String, amount: Int, amountType: String)? {
        didSet {
            configure()
        }
    }
    
    private lazy var packageNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldCardTitle.fontStyle
        lbl.textColor = adaptiveColor(.blackHigh)
    
        return lbl
    }()
    
    private lazy var packageVolumeLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldCardTitle.fontStyle
        lbl.textColor = adaptiveColor(.blackHigh)
    
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.spacing = 8
    
        self.addSubviews()
        
    }
    required init(coder: NSCoder) {
        fatalError()
    }

    private func addSubviews() {
        self.addArrangedSubview(self.packageNameLabel)
        self.addArrangedSubview(self.packageVolumeLabel)
    }
    
    private func configure() {
        guard let data = data else { return }
        self.packageNameLabel.text = data.title
        self.packageVolumeLabel.makePackageAmountLabel(amount: data.amount, amountType: data.amountType)
       
    }
}
