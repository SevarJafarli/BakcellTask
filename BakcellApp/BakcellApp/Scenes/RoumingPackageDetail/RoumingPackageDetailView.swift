//
//  RoumingPackageDetailView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit
import BakcellUIKit

protocol RoumingPackageDetailViewDelegate: AnyObject {
    func onCheckCountryBtnTapped()
}

final class RoumingPackageDetailView: UIView {

    var data: RoumingPackageDetailCardModel? {
        didSet {
            configure()
        }
    }
    
    weak var delegate: RoumingPackageDetailViewDelegate?
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var contentBackView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 24
        return view
    }()
    
    private lazy var packageInfoCardView: RoumingPackageInfoCardView = {
        let view = RoumingPackageInfoCardView()
        return view
    }()
    
    private lazy var checkCountryButton: CheckRoumingCountryButton = {
        let btn = CheckRoumingCountryButton()
        btn.addTarget(self, action: #selector(onCheckCountryBtnTap), for: .touchUpInside)
        return btn
    }()
    
    private lazy var moreInfosStackView: PackageMoreInfosStackView = {
        let view = PackageMoreInfosStackView()
        return view
    }()
    
    private lazy var activateButton: AppButton = {
       let btn = AppButton(title: "Aktivləşdir")
        return btn
    }()
    
    private lazy var backViewForButton: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.appWhite)
        
        return view
    }()
    
    //MARK: Init
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.scrollView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.contentBackView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(self.scrollView)
        }
        
        self.contentStackView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-safeAreaInsets.bottom).offset(-96) 
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        self.backViewForButton.snp.updateConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        
        self.checkCountryButton.snp.updateConstraints { make in
            make.height.equalTo(72)
        }
        
        self.activateButton.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-safeAreaInsets.bottom).offset(-16)
            make.height.equalTo(56)
        }
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.contentStackView.addArrangedSubview(self.packageInfoCardView)
        self.contentStackView.addArrangedSubview(self.checkCountryButton)
        self.contentStackView.addArrangedSubview(self.moreInfosStackView)
        
        self.contentBackView.addSubview(self.contentStackView)
        self.scrollView.addSubview(self.contentBackView)
        self.addSubview(self.scrollView)
        
        self.backViewForButton.addSubview(self.activateButton)
        self.addSubview(self.backViewForButton)
        
        
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.appWhite)
    }
    
    private func configure() {
        guard let data = data else { return }
        self.packageInfoCardView.data = data
        self.moreInfosStackView.data = data.moreInfos
    }
    
    
    @objc func onCheckCountryBtnTap() {
        delegate?.onCheckCountryBtnTapped()
    }
}

