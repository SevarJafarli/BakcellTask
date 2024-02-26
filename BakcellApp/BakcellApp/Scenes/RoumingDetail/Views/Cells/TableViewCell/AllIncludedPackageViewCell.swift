//
//  AllIncludedPackageViewCell.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 20.02.24.
//

import UIKit
import BakcellUIKit

class AllIncludedPackageViewCell: UITableViewCell, ThemeableView {
    
    var theme: ThemeProvider = App.theme
   
    static var reuseIdentifier = "AllIncludedPackageViewCell"

    var data: AllIncludedPackageModel? {
        didSet {
            configure()
        }
    }
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.appWhite)
        view.layer.cornerRadius = 24
        view.layer.borderWidth = 1
        view.layer.borderColor = adaptiveColor(.greyLight1).cgColor
        return view
    }()
 
    private lazy var cardContentView: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var titleVStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    private lazy var packageTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldHeadline.fontStyle
        lbl.textColor = adaptiveColor(.blackHigh)
        return lbl
    }()
    
    private lazy var packageServiceFeeLabel: PackageServiceFeeLabel = {
        let lbl = PackageServiceFeeLabel()
        return lbl
    }()
    
    private lazy var packageHStackView: AllIncludedPackageInfoHStackView = {
        let view = AllIncludedPackageInfoHStackView()
        return view
    }()
    
    private lazy var addButton: MiniAddButton = {
        let btn = MiniAddButton(frame: .init(x: 0, y: 0, width: 32, height: 32), cornerRadius: 12)
        return btn
    }()
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
    
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.titleVStackView.addArrangedSubview(self.packageTitleLabel)
        self.titleVStackView.addArrangedSubview(self.packageServiceFeeLabel)
       
        self.cardContentView.addSubview(self.titleVStackView)
        self.cardContentView.addSubview(self.packageHStackView)
        self.cardContentView.addSubview(self.addButton)
       
        self.backView.addSubview(self.cardContentView)
        
        self.contentView.addSubview(self.backView)
        
        self.updateConstraints()
        
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.backView.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview().inset(8)
        }
        
        self.cardContentView.snp.updateConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
        }
        
        self.titleVStackView.snp.updateConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }

        self.packageHStackView.snp.updateConstraints { make in
            make.top.equalTo(self.titleVStackView.snp.bottom).offset(16)
            make.leading.bottom.equalToSuperview()

        }
        
        self.addButton.snp.updateConstraints { make in
            make.width.height.equalTo(32)
            make.top.equalTo(self.titleVStackView.snp.bottom).offset(16)
            make.leading.equalTo(self.packageHStackView.snp.trailing).offset(16)
            make.trailing.bottom.equalToSuperview()
        }
    }
    
   
    
    func configure() {
        guard let data = self.data else {
            return
        }
        self.packageTitleLabel.text = "\(data.title)"
        
        self.packageServiceFeeLabel.configure(serviceFee: data.packagePrice, serviceType: data.packageTimeRange)
        
        self.packageHStackView.data = [data.internetPackage, data.callPackage, data.smsPackage]
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.data = nil
        self.packageHStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
