//
//  PriceComparisonView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 05.03.24.
//

import UIKit

internal class PriceComparisonView: UIView {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var contentBackView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var priceComparisonView: OperatorServicePriceComparisonView = {
        let view = OperatorServicePriceComparisonView()
        return view
    }()
    
    private lazy var roamingSegmentedControl: RoamingCountryPageSegmentedControl = {
        let segmentedControl = RoamingCountryPageSegmentedControl()
        segmentedControl.delegate = self
        return segmentedControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
    
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

private func addSubviews() {
    self.addSubview(self.roamingSegmentedControl)
    self.addSubview(self.scrollView)
    self.scrollView.addSubview(self.contentBackView)
    self.contentBackView.addSubview(self.priceComparisonView)
    
    self.updateConstraints()
}

override func updateConstraints() {
    super.updateConstraints()
    self.roamingSegmentedControl.snp.updateConstraints { make in
        make.top.equalToSuperview().offset(16)
        make.horizontalEdges.equalToSuperview().inset(16)
        make.height.equalTo(32)
    }
    self.scrollView.snp.updateConstraints { make in
        make.top.equalTo(self.roamingSegmentedControl.snp.bottom)
        make.horizontalEdges.bottom.equalToSuperview()
    }
    
    self.contentBackView.snp.updateConstraints { make in
        make.edges.equalToSuperview()
        make.width.equalTo(120 * 3 + 32 + 4 * 1)
    }
    
    self.priceComparisonView.snp.updateConstraints { make in
        make.edges.equalToSuperview().inset(16)
    }
}
}

//MARK: SegmentedControlDelegate
extension PriceComparisonView: SegmentedControlDelegate {
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int) { }
}
