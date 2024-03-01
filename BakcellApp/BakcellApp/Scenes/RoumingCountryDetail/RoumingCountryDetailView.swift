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
    
    lazy var contentTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.contentInset = .zero
        tableView.register(OperatorViewCell.self, forCellReuseIdentifier: OperatorViewCell.reuseIdentifier)
        
        tableView.register(PriceComparisonViewCell.self, forCellReuseIdentifier: PriceComparisonViewCell.reuseIdentifier)
        return tableView
        
    }()
    
    lazy var roamingSegmentedControl: SegmentedControl = {
        let segmentedControl = SegmentedControl()
        segmentedControl.backgroundColor = adaptiveColor(.greyBg)
        segmentedControl.selectionBoxStyle = .default
        segmentedControl.selectionBoxColor = adaptiveColor(.appWhite)
        segmentedControl.selectionBoxCornerRadius = 10
        segmentedControl.layoutPolicy = .fixed
        segmentedControl.segmentSpacing = 0
        segmentedControl.selectionBoxHeight = 32
        segmentedControl.selectionHorizontalPadding = 8
        segmentedControl.contentInset = .zero
        segmentedControl.clipsToBounds = true
        segmentedControl.delegate = self
        return segmentedControl
    }()
    
    lazy var backViewForRoamingSegmentedControl: UIView = {
        let view = UIView()
        return view
    }()
    
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        self.setSegmentedControl()
        
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
        
        self.backViewForRoamingSegmentedControl.snp.updateConstraints { make in
            make.height.equalTo(64)
            make.width.equalToSuperview()
        }
        
        self.roamingSegmentedControl.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        self.contentTableView.snp.updateConstraints { make in
            make.top.equalTo(self.filterSegmentedControl.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        
        
        // Set a fixed height for the tableHeaderView
        if let headerView = self.contentTableView.tableHeaderView {
            headerView.frame.size.height = 64
        }
        
    }
    
    // MARK: - Private
    
    private func addSubviews() {
        
        self.addSubview(self.filterSegmentedControl)
        self.addSubview(self.contentTableView)
        self.backViewForRoamingSegmentedControl.addSubview(self.roamingSegmentedControl)
        self.contentTableView.tableHeaderView = self.backViewForRoamingSegmentedControl
        
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.greyBg)
    }
    
    func setSegmentedControl() {
        let titleStrings = ["Öncədən ödənişli", "Fakturalı"]
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
            let attributes: [NSAttributedString.Key: Any] =  [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.blackHigh)]
            var selectedTitles = [NSAttributedString]()
            for titleString in titleStrings {
                let selectedTitle = NSAttributedString(string: titleString, attributes: attributes)
                selectedTitles.append(selectedTitle)
            }
            return selectedTitles
        }()
        
        self.roamingSegmentedControl.setTitles(titles, selectedTitles: selectedTitles)
        
    }
}

//MARK: UITableView

extension RoumingCountryDetailView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

                if self.selectedIndex == 1 {
                    return 3
                }
                else if self.selectedIndex == 2 {
                    return 1
                }
                else {
                    return 0
                }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(self.selectedIndex)
        if self.selectedIndex == 1 {
            print("index is one")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OperatorViewCell.reuseIdentifier, for: indexPath) as?  OperatorViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        else if self.selectedIndex == 2 {
            print("index is two")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PriceComparisonViewCell.reuseIdentifier, for: indexPath) as?  PriceComparisonViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        else {
            print("index is not one")
            let cell =  UITableViewCell()
            cell.backgroundColor = .red
            return cell
        }
        
        
    }
}


extension RoumingCountryDetailView: SegmentedControlDelegate {
    
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int) {
        if segmentedControl == self.roamingSegmentedControl {
            
        }
        
        else if segmentedControl == self.filterSegmentedControl {
            self.selectedIndex = selectedIndex
            
            self.contentTableView.contentInset = self.selectedIndex == 2 ? .init(top: 0, left: 8, bottom: 0, right: 8) : .zero

            self.contentTableView.reloadData()
        }
    }
}

