//
//  RoumingCountryButton.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 21.02.24.
//

import UIKit
import BakcellUIKit

class RoumingCountryButton: UICollectionViewCell {
    static var reuseIdentifier = "RoumingCountryButton"
    

    var data: String? {
        didSet {
            configure()
        }
    }
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
    override func prepareForReuse() {
        super.prepareForReuse()
        data = nil
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        self.backView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.title.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().priority(.high)
            make.height.equalTo(40)
        }
    }
    
    //MARK: Public
     func configure() {
         if let data = data {
             self.title.text = data
         }
    }
    
}
