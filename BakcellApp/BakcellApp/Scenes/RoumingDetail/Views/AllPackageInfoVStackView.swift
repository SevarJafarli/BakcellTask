//
//  AllPackageInfoStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 20.02.24.
//

import UIKit
import BakcellUIKit

class AllPackageInfoVStackView: UIStackView, ThemeableView {
  
    var theme: ThemeProvider = App.theme
    
    let title: String
    let subtitle: String
    
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFRegularCaption1.fontStyle
        lbl.textColor = adaptiveColor(.blackMedium)
        return lbl
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldCardTitle.fontStyle
        lbl.textColor = adaptiveColor(.blackHigh)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    //MARK: Init
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        
        super.init(frame: .zero)
        self.axis = .vertical
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.addSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addArrangedSubview(self.titleLabel)
        self.addArrangedSubview(self.subtitleLabel)
    }

}
