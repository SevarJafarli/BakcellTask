//
//  PackageFreeServicesStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 16.02.24.
//

import UIKit
import BakcellUIKit

class PackageFreeServicesStackView: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    private lazy var freeServicesView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var freeServiceLogo: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var freeServiceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFRegularBody.fontStyle
        lbl.textColor = adaptiveColor(.blackHigh)
        lbl.text = "Pulsuz"
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.freeServicesView.addArrangedSubview(self.freeServiceLogo)
        self.freeServicesView.addArrangedSubview(self.freeServiceLabel)
        self.addSubview(self.freeServicesView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.freeServicesView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        self.freeServiceLogo.snp.updateConstraints { make in
            make.width.height.equalTo(20)
        }
    }
    //MARK: Public
    public func configure(image: UIImage) {
        self.freeServiceLogo.image = image
    }
}
