//
//  CheckRoumingCountryButton.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit
import BakcellUIKit

class CheckRoumingCountryButton: UIButton {
    
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .equalSpacing
        view.alignment = .top
        return view
    }()
    
    private lazy var iconView: PackageIconView = {
        let iconView = PackageIconView()
        iconView.image = UIImage(named: AppAssets.flag.rawValue)
        return iconView
    }()
    
    private lazy var hStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 16
        return view
    }()
    
    private lazy var titleVStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        return view
    }()
    
    private lazy var buttonTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ölkə yoxla"
        lbl.textColor = adaptiveColor(.blackHigh)
        lbl.font = AppFonts.SFBoldCallout.fontStyle
        return lbl
    }()
    
    private lazy var buttonSubtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = adaptiveColor(.greyTextHelper)
        lbl.font = AppFonts.SFRegularCaption1.fontStyle
        lbl.text = "20 ölkədə dəstəklənir"
        return lbl
    }()
    
    private lazy var searchIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: AppAssets.search.rawValue)
        view.tintColor = adaptiveColor(.blackHigh)
        return view
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
        self.addSubviews()
        
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupButton() {
        self.backgroundColor = adaptiveColor(.appWhite)
        self.layer.cornerRadius = 24
        self.layer.borderWidth = 2
        self.layer.borderColor = adaptiveColor(.greyLight1).cgColor
        
        
    }
    
    private func addSubviews() {
        self.hStackView.addArrangedSubview(self.iconView)
        self.hStackView.addArrangedSubview(self.titleVStackView)
        self.titleVStackView.addArrangedSubview(self.buttonTitleLabel)
        self.titleVStackView.addArrangedSubview(self.buttonSubtitleLabel)
        
        self.contentStackView.addArrangedSubview(self.hStackView)
        self.contentStackView.addArrangedSubview(self.searchIcon)
        self.addSubview(self.contentStackView)
                
        self.updateConstraints()
        
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.contentStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
    
        }
        self.hStackView.snp.updateConstraints { make in
            make.height.equalTo(40)
        }
        self.iconView.snp.updateConstraints { make in
            make.width.height.equalTo(40)
        }
        self.searchIcon.snp.updateConstraints { make in
            make.width.height.equalTo(24)
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
           let convertedPoint = self.convert(point, to: self)

           // If the point is inside the button's bounds, return the button
           if self.bounds.contains(convertedPoint) {
               return self
           }

           // If not, return nil to allow the system to find the appropriate view
           return nil
       }
}

