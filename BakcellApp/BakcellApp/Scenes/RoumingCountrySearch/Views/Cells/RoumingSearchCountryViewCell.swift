//
//  RoumingSearchCountryViewCell.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit
import BakcellUIKit

class RoumingSearchCountryViewCell: UITableViewCell {

    
    static var reuseIdentifier = "RoumingSearchCountryViewCell"
    
    var data: RoumingSearchCountryViewCellModel? {
        didSet {
            configure()
        }
    }
    
    private lazy var contentBackView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.appWhite)
        view.layer.cornerRadius = 24
        view.applyGreyBorders()
        return view
    }()
    
    
    private lazy var contentHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal

        stackView.spacing = 12
        stackView.alignment = .top
        return stackView
    }()
    
    private lazy var backViewFortrailingHStackView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var trailingHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
    
    private lazy var countryFlagImageView: UIImageView = {
        let view = UIImageView()
        view.image = AppAssets.turkiye.load()
        view.contentMode = .scaleAspectFit
        return view
    }()
    

    private lazy var textsVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 6
        return stackView
    }()
    
    
    private lazy var countryNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldHeadline.fontStyle
        lbl.textColor = adaptiveColor(.blackHigh)
        return lbl
    }()
    
    private lazy var operatorsLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFRegularCaption1.fontStyle
        lbl.textColor = adaptiveColor(.blackMedium)
        return lbl
    }()

    private lazy var doneIcon: UIImageView = {
        let view = UIImageView()
        view.image = AppAssets.done.load()
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.addSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func addSubviews() {
        self.contentHStackView.addArrangedSubview(self.countryFlagImageView)
        
        self.trailingHStackView.addArrangedSubview(self.countryNameLabel)
        
        self.trailingHStackView.addArrangedSubview(self.doneIcon)
        
        self.backViewFortrailingHStackView.addSubview(self.trailingHStackView)
        
        self.textsVStackView.addArrangedSubview(self.backViewFortrailingHStackView)

        self.textsVStackView.addArrangedSubview(self.operatorsLabel)
   
    
        
        self.contentHStackView.addArrangedSubview(self.textsVStackView)
        
        
        self.contentBackView.addSubview(self.contentHStackView)
        
        self.contentView.addSubview(self.contentBackView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.contentBackView.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview().inset(8)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.contentHStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        self.countryFlagImageView.snp.updateConstraints { make in
            make.width.equalTo(28)
            make.height.equalTo(20)
        }
        
        self.countryFlagImageView.snp.updateConstraints { make in
            make.width.height.equalTo(24)
            
        }
        
        self.trailingHStackView.snp.updateConstraints { make in
            make.trailing.equalToSuperview().offset(-12)
            make.leading.top.bottom.equalToSuperview()
        }
    }
    
    
    private func configure() {
        guard let data = data else { return }
        
        self.countryFlagImageView.image = data.countryFlag
        self.countryNameLabel.text = data.countryName
        self.operatorsLabel.text = data.operators.joined(separator: ", ")
    }
}
