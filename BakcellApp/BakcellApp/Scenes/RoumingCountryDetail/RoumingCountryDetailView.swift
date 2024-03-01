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
        self.contentTableView.isHidden = true
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OperatorViewCell.reuseIdentifier, for: indexPath) as?  OperatorViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

