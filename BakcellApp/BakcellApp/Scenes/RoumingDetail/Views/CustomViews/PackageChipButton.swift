//
//  PackageChipButton.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 16.02.24.
//

import UIKit
import BakcellUIKit

class PackageChipButton: UIView {
//    var theme: ThemeProvider = App.theme

    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldCaption1.fontStyle
        lbl.textColor = adaptiveColor(.blackHigh)
        return lbl
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        self.addSubviews()

    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.greyBg)
        self.layer.cornerRadius = 8
    }
    
    private func addSubviews() {
        self.addSubview(self.titleLabel)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.titleLabel.snp.updateConstraints { make in
            make.center.equalToSuperview()
        }
    
    }
    
    public func configure(with title: String) {
        self.titleLabel.text = title
    }
}
