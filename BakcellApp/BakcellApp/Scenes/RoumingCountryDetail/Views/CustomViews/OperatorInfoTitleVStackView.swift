//
//  OperatorInfoTitleVStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit
import BakcellUIKit

class OperatorInfoTitleVStackView: UIStackView {
    
    private lazy var infoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: AppAssets.phone.rawValue)
        return view
    }()
    
    private lazy var infoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.SFBoldSubheadline.fontStyle
        label.textColor = adaptiveColor(.blackHigh)
        return label
    }()
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.spacing = 16
        self.addSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

    private func addSubviews() {
        self.addArrangedSubview(self.infoImageView)
        self.addArrangedSubview(self.infoTitleLabel)
        
        self.updateConstraints()
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.infoImageView.snp.updateConstraints { make in
            make.width.equalTo(24)
        }
    }
    
    public func configure(title: String, image: UIImage) {
        self.infoTitleLabel.text = title
        self.infoImageView.image = image
       
    }
}
