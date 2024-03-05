//
//  PackageSingleMoreInfoStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit
import BakcellUIKit

class PackageSingleMoreInfoStackView: UIStackView {
    
    
    var data: RoumingPackageMoreInfoModel? {
        didSet {
            configure()
        }
    }

   
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldSubheadline.fontStyle
        return lbl
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = adaptiveColor(.blackHigh)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        self.spacing = 8
        self.axis = .vertical
        
        self.addSubviews()
    }

    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addArrangedSubview(self.titleLabel)
        self.addArrangedSubview(self.subtitleLabel)
        
        self.updateConstraints()
    }
    
    private func configure() {
        guard let data = data else { return }
        self.titleLabel.text = data.title
        self.titleLabel.textColor = data.subtitleColor ?? adaptiveColor(.blackHigh)
        
        self.subtitleLabel.setBulletText(data.subtitle, font: AppFonts.SFRegularSubheadline.fontStyle, bulletColor: data.subtitleColor ??  adaptiveColor(.blackHigh), textColor: data.subtitleColor ??  adaptiveColor(.blackHigh))
    }
}
