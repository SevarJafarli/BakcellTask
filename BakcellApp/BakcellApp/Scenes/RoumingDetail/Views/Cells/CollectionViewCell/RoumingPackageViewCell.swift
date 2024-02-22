//
//  RoumingPackageViewCell.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit
import BakcellUIKit

class RoumingPackageViewCell: UICollectionViewCell, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    
    static var reuseIdentifier = "RoumingPackageViewCell"
    
    private lazy var contentVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var amountLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    private lazy var serviceFeeLabel: PackageServiceFeeLabel = {
        let lbl = PackageServiceFeeLabel()
        return lbl
    }()
    
    private lazy var freeServiceView: PackageFreeServicesStackView = {
        let view = PackageFreeServicesStackView()
        return view
    }()
    
    private lazy var chipButton: PackageChipButton = {
        let view = PackageChipButton()
        return view
    }()
    
    
    private lazy var miniAddButton: MiniAddButton = {
        let btn = MiniAddButton(frame: .init(x: 0, y: 0, width: 24, height: 24), cornerRadius: 8)
        return btn
    }()
    
    private lazy var hStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        return view
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupContentView()
        self.addSubviews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupContentView() {
        self.contentView.backgroundColor = adaptiveColor(.appWhite)
        self.contentView.layer.cornerRadius = 24
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = adaptiveColor(.greyLight1).cgColor
    }
    
    private func addSubviews() {
        self.contentVStackView.addArrangedSubview(self.amountLabel)
        
        self.contentVStackView.addArrangedSubview(self.freeServiceView)
        
        self.contentVStackView.addArrangedSubview(self.serviceFeeLabel)
        
        self.hStackView.addArrangedSubview(self.chipButton)
        
        self.hStackView.addArrangedSubview(self.miniAddButton)
        
        self.contentVStackView.addArrangedSubview(self.hStackView)
        
        self.addSubview(self.contentVStackView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.contentVStackView.snp.updateConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
        }
        
        self.chipButton.snp.updateConstraints { make in
            make.width.equalTo(54)
            make.height.equalTo(24)
        }
        
        self.miniAddButton.snp.updateConstraints { make in
            make.width.height.equalTo(24)
        }
    }
    
    //MARK: Public
    public func configure(model: PackageModel) {
        
        let packageModelType = model.packageModelType
        
        switch packageModelType {
        case .internet:
            guard let internetModel = model as? InternetPackageModel else {
                return
            }
            self.setAmountLabel(amount: internetModel.package.packageAmount, amountType: internetModel.package.amountType)
            
            self.serviceFeeLabel.configure(serviceFee: internetModel.packagePrice, serviceType: internetModel.packageTimeRange)

            self.chipButton.configure(with: model.packageModelType.title!)
            
            self.freeServiceView.configure(image: UIImage(named: AppAssets.whatsapp.rawValue)!)
            
            
        case .smsAndCall:
            
            guard let smsModel = model as? SMSPackageModel else {
                return
            }
            self.setAmountLabel(amount: smsModel.package.packageAmount, amountType: smsModel.package.amountType)
            
            self.serviceFeeLabel.configure(serviceFee: smsModel.packagePrice, serviceType: smsModel.packageTimeRange)
            
            self.chipButton.configure(with: model.packageModelType.title!)
            
            self.freeServiceView.removeFromSuperview()
        default:
            break
        }
    }
    
    //TODO: refactor
    
    private func setAmountLabel(amount: Int, amountType: String) {
        let attributedString = NSMutableAttributedString(string: "\(amount) \(amountType)")
        
        let boldRange = NSRange(location: 0, length: String(amount).count)
        attributedString.addAttribute(.font, value: AppFonts.SFBoldLargeTitle.fontStyle, range: boldRange)
        attributedString.addAttribute(.foregroundColor, value: adaptiveColor(.blackHigh), range: boldRange)
        
        
        let regularRange = NSRange(location: String(amount).count + 1, length: String(amountType).count)
        
        attributedString.addAttribute(.font, value: AppFonts.SFBoldTitle2.fontStyle, range: regularRange)
        attributedString.addAttribute(.foregroundColor,  value: adaptiveColor(.blackHigh), range: regularRange)
        
        self.amountLabel.attributedText = attributedString
        
    }
}
