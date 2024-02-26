//
//  OperatorServiceInfoStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit
import BakcellUIKit

class OperatorServiceInfoStackView: UIStackView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    
    private lazy var infoTitleHStackView: UIStackView = {
        let stackView =  UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var infoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: AppAssets.phone.rawValue)
        return view
    }()
    
    private lazy var infoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.SFBoldSubheadline.fontStyle
        label.textColor = adaptiveColor(.blackHigh)
        label.text = "Zənglər"
        return label
    }()
    
    private lazy var statusVStackView: OperatorStatusVStackView = {
        let stackView = OperatorStatusVStackView()
        return stackView
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.spacing = 24
        
        self.addSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

    
    private func addSubviews() {
        self.infoTitleHStackView.addArrangedSubview(self.infoImageView)
        self.infoTitleHStackView.addArrangedSubview(self.infoTitleLabel)

        self.addArrangedSubview(self.infoTitleHStackView)
        
        self.addArrangedSubview(self.statusVStackView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.infoImageView.snp.updateConstraints { make in
            make.width.height.equalTo(24)
        }
    }
}
