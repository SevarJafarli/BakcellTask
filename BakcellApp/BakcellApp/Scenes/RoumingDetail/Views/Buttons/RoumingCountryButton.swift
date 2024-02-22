//
//  RoumingCountryButton.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 21.02.24.
//

import UIKit
import BakcellUIKit

class RoumingCountryButton: UICollectionViewCell, ThemeableView {
    static var reuseIdentifier = "RoumingCountryButton"
    var theme: ThemeProvider = App.theme
    
    private lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldFootnote.fontStyle
        lbl.textColor = adaptiveColor(.greyText)
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.appWhite)
        view.layer.borderColor = adaptiveColor(.greyInput).cgColor
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        
        return view
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
//        self.setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func addSubviews() {
        self.backView.addSubview(self.title)
        self.addSubview(self.backView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.backView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.title.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview().inset(11)
//            make.center.equalToSuperview()
        }
    }
    
//    private func setupButton() {
//        self.backgroundColor = adaptiveColor(.appWhite)
//        self.setTitle("Türkiyə", for: .normal)
//        self.setTitleColor(adaptiveColor(.greyText), for: .normal)
//        self.layer.borderColor = adaptiveColor(.greyInput).cgColor
//        self.titleLabel?.font = AppFonts.SFBoldFootnote.fontStyle
//        self.layer.borderWidth = 2
//        self.layer.cornerRadius = 16
//        self.contentEdgeInsets = UIEdgeInsets(top: 11, left: 16, bottom: 11, right: 16)
//
//    }
    
    public func configure(with text: String) {
        self.title.text = text
    }
}
