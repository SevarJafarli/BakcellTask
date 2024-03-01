//
//  CategoryCollectionViewCell.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit
import BakcellUIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier = "CategoryCollectionViewCell"
    
    var data: String? {
        didSet {
            configure()
        }
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.SFRegularSubheadline.fontStyle
        label.textColor = adaptiveColor(.blackHigh)
        return label
    }()
    
    var isCategorySelected: Bool? {
        didSet {

            self.updateAppearance()

        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        
        self.backView.addSubview(self.titleLabel)
        self.addSubview(self.backView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.backView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(32)
        }
        
        self.titleLabel.snp.updateConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
        }
    }
    
    private func updateAppearance() {
        if let isSelected = isCategorySelected {
            self.backView.layer.cornerRadius = isSelected ? 12 : 0
            self.backView.backgroundColor = isSelected ? adaptiveColor(.redPrimary): .clear
            self.titleLabel.textColor = isSelected ?  adaptiveColor(.appWhite): adaptiveColor(.blackHigh)
        }
    }
    
    
    func configure() {
        if let data = data {
            self.titleLabel.text = data
        }
   }
}
