//
//  RoumingCountryDetailView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit
import BakcellUIKit

protocol RoumingCountryDetailViewDelegate: AnyObject {

}

final class RoumingCountryDetailView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    
    weak var delegate: RoumingCountryDetailViewDelegate?
   
    lazy var filterSegmentedControl: SegmentedControl = {
        let segmentedControl = SegmentedControl()
      
        segmentedControl.backgroundColor = .white
        segmentedControl.selectionBoxStyle = .default
        segmentedControl.selectionBoxColor = adaptiveColor(.redPrimary)
        segmentedControl.selectionBoxCornerRadius = 12 // default is 0
        segmentedControl.layoutPolicy = .dynamic
        segmentedControl.segmentSpacing = 8
        segmentedControl.selectionBoxHeight = 32
        segmentedControl.selectionHorizontalPadding = 8
        segmentedControl.contentInset = .zero
        segmentedControl.clipsToBounds = true
        return segmentedControl
    }()
    
  
    lazy var operatorsView: OperatorsView = {
        let view = OperatorsView()
        view.backgroundColor = .clear
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
        
        self.filterSegmentedControl.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
        
        self.operatorsView.snp.updateConstraints { make in
            make.top.equalTo(self.filterSegmentedControl.snp.bottom).offset(24)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.filterSegmentedControl)
        self.addSubview(self.operatorsView)
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.greyBg)
    }
    
}
