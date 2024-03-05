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

final class RoumingCountryDetailView: UIView {
    
    weak var delegate: RoumingCountryDetailViewDelegate?
    
    var selectedIndex = 0
    
  
    lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.isPagingEnabled = false
        return pageViewController
    }()
    
    lazy var filterSegmentedControl: SegmentedControl = {
        let segmentedControl = SegmentedControl()
        segmentedControl.backgroundColor = .white
        segmentedControl.selectionBoxStyle = .default
        segmentedControl.selectionBoxColor = adaptiveColor(.redPrimary)
        segmentedControl.selectionBoxCornerRadius = 12
        segmentedControl.layoutPolicy = .dynamic
        segmentedControl.segmentSpacing = 8
        segmentedControl.selectionBoxHeight = 32
        segmentedControl.selectionHorizontalPadding = 8
        segmentedControl.contentInset = .zero
        segmentedControl.clipsToBounds = true
        segmentedControl.delegate = self
        return segmentedControl
    }()
    
    private lazy var firstViewController = UIViewController()
    private lazy var operatorsViewController = OperatorsViewController()
    private lazy var priceComparisonViewController = PriceComparisonViewController()

    private lazy var pageViewControllers: [UIViewController] = [firstViewController, operatorsViewController, priceComparisonViewController]
    
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        self.addSubviews()
        self.setupUI()
        self.setSegmentedControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        super.updateConstraints()
        
        self.pageViewController.view.snp.updateConstraints { make in
            make.top.equalTo(self.filterSegmentedControl.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        self.filterSegmentedControl.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
    }

    
    // MARK: - Private
    
    private func addSubviews() {
      
        self.addSubview(self.filterSegmentedControl)
        self.addSubview(self.pageViewController.view)
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.greyBg)
    }
    
    
    private func showViewController() {
        pageViewController.setViewControllers([pageViewControllers[selectedIndex]], direction: .forward, animated: true, completion: nil)
    }
}

//MARK: SegmentedControlDelegate

extension RoumingCountryDetailView: SegmentedControlDelegate {
    //Set titles for segmented control
    func setSegmentedControl() {
        let titleStrings = RoumingCountryDetail.categories
        let titles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] = [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.blackHigh)]
            var titles = [NSAttributedString]()
            for titleString in titleStrings {
                let title = NSAttributedString(string: titleString, attributes: attributes)
                titles.append(title)
            }
            return titles
        }()
        
        let selectedTitles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] =  [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.appWhite)]
            var selectedTitles = [NSAttributedString]()
            for titleString in titleStrings {
                let selectedTitle = NSAttributedString(string: titleString, attributes: attributes)
                selectedTitles.append(selectedTitle)
            }
            return selectedTitles
        }()
        
        self.filterSegmentedControl.setTitles(titles, selectedTitles: selectedTitles)
    }
    
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int) {
            self.selectedIndex = selectedIndex
            showViewController()
        }
}

//MARK: UIPageViewControllerDelegate, UIPageViewControllerDataSource

extension RoumingCountryDetailView: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pageViewControllers.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        return pageViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pageViewControllers.firstIndex(of: viewController), currentIndex < pageViewControllers.count - 1 else {
            return nil
        }
        return pageViewControllers[currentIndex + 1]
    }
}
