//
//  PriceComparisonViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 04.03.24.
//

import UIKit
import BakcellUIKit

class PriceComparisonViewController: UIViewController, ThemeableViewController {

    var theme: ThemeProvider = App.theme
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var contentBackView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var priceComparisonView: PriceComparisonView = {
        let view = PriceComparisonView()
        return view
    }()
    
    private lazy var roamingSegmentedControl: RoamingCountryPageSegmentedControl = {
        let segmentedControl = RoamingCountryPageSegmentedControl()
        segmentedControl.delegate = self
        return segmentedControl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviews()
    }
    

    private func addSubviews() {
        self.view.addSubview(self.roamingSegmentedControl)
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentBackView)
        self.contentBackView.addSubview(self.priceComparisonView)
        
        self.updateViewConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
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
extension PriceComparisonViewController: SegmentedControlDelegate {
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int) {

    }
}
