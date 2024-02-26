//
//  CountrySearchView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 21.02.24.
//

import UIKit
import BakcellUIKit

class CountrySearchView: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    private lazy var placeholderTextLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.SFRegularBody.fontStyle
        label.textColor = adaptiveColor(.blackHigh)
        label.text = "Axtarış..."
        return label
    }()
    private lazy var searchIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AppAssets.search.rawValue)?.resized(to: .init(width: 24, height: 24))
        return imageView
    }()
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackView()
        self.addSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func setupBackView() {
        self.backgroundColor = adaptiveColor(.appWhite)
        self.layer.borderWidth = 2
        self.layer.borderColor = adaptiveColor(.greyLight).cgColor
        self.layer.cornerRadius = 12
       
    }
    private func addSubviews() {
        self.addSubview(self.placeholderTextLabel)
        self.addSubview(self.searchIconImageView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    
        self.placeholderTextLabel.snp.updateConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        self.searchIconImageView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(self.placeholderTextLabel.snp.trailing).offset(10)
            make.trailing.bottom.equalToSuperview().offset(-16)
            make.width.height.equalTo(24)
        }
    }
}
